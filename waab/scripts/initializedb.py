from __future__ import unicode_literals
import sys
import re

from path import path
from pylab import figure, axes, pie, savefig
import xlrd
from sqlalchemy import create_engine
from bs4 import BeautifulSoup as bs
from clld.scripts.util import initializedb, Data, bibtex2source
from clld.db.meta import DBSession
from clld.db.models import common
from clld.util import slug
from clld.lib import bibtex
from clld.lib import dsv

import waab
from waab import models


citation = re.compile('\[(?P<ids>[0-9]{1,3}(,\s*[0-9]{1,3})*)\]')
GC = create_engine('postgresql://robert@/glottolog3')

glottocodes = {}
for row in GC.execute('select ll.hid, l.id from language as l, languoid as ll where ll.pk = l.pk'):
    if row[0] and len(row[0]) == 3:
        glottocodes[row[0]] = row[1]


def text(n):
    return ' '.join(list(n.stripped_strings))


def main(args):
    data = Data()

    pairs = {}
    languages = {}

    coords = {}
    for lang in dsv.rows(
        args.data_file('MB_Map_Data_Aug13WLabels'),
        namedtuples=True,
        newline='\n',
        encoding='latin1'
    ):
        coords[slug(lang.Label.split('<')[0].strip())] = (
            float(lang.y), float(lang.x))

    xls = xlrd.open_workbook(args.data_file('MB_BoCatSum_AFBO.xlsx'))
    matrix = xls.sheet_by_name('MB_BoCatSum_AFBO.txt')
    md = "Area\trecipient language iso\trecipient language genus\tdonor language iso\tdonor language genus".split('\t')

    fields = []
    params = []
    for i in range(matrix.ncols):
        colname = xlrd.colname(i)
        colval = matrix.cell(0, i).value.strip()
        if (len(colname) == 1 and colname > 'G') or (len(colname) == 2 and colname < 'BA'):
            params.append(colval)
        fields.append(colval)

    assert len(fields) == len(set(fields))

    for j in range(1, matrix.nrows):
        values = dict(zip(fields, [matrix.cell(j, i).value for i in range(matrix.ncols)]))
        try:
            id_ = int(values['perm.id'])
        except:
            continue

        pairs[id_] = values
        for type_ in ['recipient', 'donor']:
            languages[values[type_.capitalize() + ' language']] = {
                'macroarea': values['Area']}
            for md in ['iso', 'genus']:
                languages[values[type_.capitalize() + ' language']][md] \
                    = values['%s language %s' % (type_, md)]

    sources = {}
    with open(args.data_file('MB_Case_List_with_links.html')) as fp:
        worddoc = fp.read()
        for m in re.finditer('\"|(?P<recid>[^|]+)|\"', worddoc):
            sources[m.group('recid')] = 1
        soup = bs(worddoc)

    doc = {}
    cols = []
    table = soup.find('table')
    for tr in table.children:
        if tr.name != 'tr':
            continue
        tds = filter(lambda n: n.name == 'td', tr.children)
        if not cols:
            cols = map(text, tds)
        else:
            values = dict(zip(cols, tds))
        try:
            id_ = int(text(values['perm.id']))
            doc[id_] = values
            if id_ in pairs:
                try:
                    assert doc['Recipient lg.'] == pairs[id_][1]['Recipient language']
                    assert doc['Don'] == pairs[id_][1]['Donor language']
                except:
                    print doc['Recipient lg.'], doc['Don']
                    print pairs[id_][1]['Recipient language'], pairs[id_][1]['Donor language']
            else:
                print "----!---", id_
            #print id_, id_ in pairs
        except:
            continue

    dataset = common.Dataset(
        id='afbo',
        name="AFBO: A world-wide survey of affix borrowing",
        domain="afbo.clld.org")
    DBSession.add(dataset)
    for i, spec in enumerate([('seifart', "Frank Seifart")]):
        DBSession.add(common.Editor(
            dataset=dataset,
            ord=i + 1,
            contributor=common.Contributor(id=spec[0], name=spec[1])))

    contrib = data.add(common.Contribution, 'afbo', name="AFBO", id="afbo")

    for i, name in enumerate(languages.keys()):
        md = languages[name]
        iso = md.pop('iso')
        kw = dict(name=name, id=str(i+1), jsondata=md)
        if slug(name) in coords:
            kw['latitude'], kw['longitude'] = coords[slug(name)]
        l = data.add(common.Language, name, **kw)

        for code, type_ in [
            (iso, common.IdentifierType.iso),
            (glottocodes.get(iso), common.IdentifierType.glottolog)
        ]:
            if code:
                identifier = data.add(
                    common.Identifier, code, id=code, name=code, type=type_.value)
                data.add(
                    common.LanguageIdentifier, '%s-%s' % (code, l.id),
                    identifier=identifier, language=l)

    refdb = bibtex.Database.from_file(args.data_file('FSeifartsZoteroLibraryOct2013.bib'))
    for rec in refdb:
        if slug(rec.id) in sources:
            data.add(common.Source, slug(rec.id), _obj=bibtex2source(rec))

    for i, name in enumerate(params):
        data.add(models.AffixFunction, name, id=str(i + 1), name=name)

    for id_, vd in pairs.items():
        assert id_ in doc

        donor = data['Language'][vd['Donor language']]
        recipient = data['Language'][vd['Recipient language']]

        p = data.add(
            models.Pair,
            id_,
            id=str(id_),
            name=vd['Pairs'],
            area=recipient.jsondata['macroarea'],
            description=unicode(doc[id_]['comment']).replace('<h1', '<p').replace('</h1>', '</p>'),
            reliability=vd['reliab'],
            count_interrel=int(vd[u'number of interrelated affixes']),
            count_borrowed=int(vd['number of borrowed affixes']),
            donor=donor,
            recipient=recipient)
        DBSession.flush()

        for i, param in enumerate(params):
            param_id = i + 1
            value = vd[param]
            if value != '':
                vsid = '%s-%s' % (recipient.id, param_id)
                if vsid in data['ValueSet']:
                    vs = data['ValueSet'][vsid]
                else:
                    vs = data.add(
                        common.ValueSet, vsid,
                        id=vsid,
                        parameter=data['AffixFunction'][param],
                        language=recipient,
                        contribution=contrib)
                data.add(
                    models.waabValue,
                    '%s-%s' % (id_, param_id),
                    id='%s-%s' % (id_, param_id),
                    pair=p,
                    name='%s' % int(value),
                    numeric=int(value),
                    description='%s' % p,
                    valueset=vs)


def prime_cache(args):
    """If data needs to be denormalized for lookup, do that here.
    This procedure should be separate from the db initialization, because
    it will have to be run periodiucally whenever data has been updated.
    """
    for param in DBSession.query(models.AffixFunction):
        param.representation = len(param.valuesets)
        param.count_borrowed = sum(
            sum(v.numeric for v in vs.values) for vs in param.valuesets)

    colors = {}
    for _min, _max, color in waab.COLOR_MAP:
        _min = _min or 0
        _max = _max or 100
        for i in range(_min, _max + 1):
            colors[i] = color

    icons_dir = path(waab.__file__).dirname().joinpath('static')
    for color in colors.values():
        figure(figsize=(0.4, 0.4))
        axes([0.1, 0.1, 0.8, 0.8])
        coll = pie((100,), colors=('#' + color,))
        coll[0][0].set_linewidth(0.5)
        savefig(icons_dir.joinpath('%s.png' % color), transparent=True)

    for l in DBSession.query(common.Language)\
            .join(models.Pair, common.Language.pk == models.Pair.recipient_pk):
        l.update_jsondata(color=colors[max(p.count_borrowed for p in l.donor_assocs)])

    for p in DBSession.query(models.Pair):
        for source_id in set(waab.SOURCE_ID_PATTERN.findall(p.description)):
            try:
                p.sources.append(common.Source.get(source_id))
            except:
                print source_id


if __name__ == '__main__':
    initializedb(create=main, prime_cache=prime_cache)
    sys.exit(0)
