from __future__ import unicode_literals
import sys
import re
from collections import defaultdict

from path import path
from pylab import figure, axes, pie, savefig
import xlrd
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


def text(n):
    return ' '.join(list(n.stripped_strings))


super_params = [
    "comparative/superlative",
    "comparative/superlative",
    "adjectivizer",
    "adverbializer",
    "clause-level TAM",
    "clause linking",
    "case: core case",
    "case: core case",
    "case: core case",
    "case: peripheral case",
    "case: peripheral case",
    "case: peripheral case",
    "gender",
    "gender",
    "diminutive/augmentative",
    "diminutive/augmentative",
    "definite/indefinite",
    "topic, focus",
    "topic, focus",
    "nominalizer",
    "nominalizer",
    "nominalizer",
    "nominalizer",
    "nominalizer",
    "number",
    "number",
    "number",
    "number",
    "miscellaneous nominal derivation",
    "privative",
    "argument index",
    "numeral classifier",
    "numeral derivation",
    "numeral derivation",
    "valency change",
    "valency change",
    "valency change",
    "valency change",
    "valency change",
    "verbal TAM",
    "miscellaneous verbal derivation",
    "argument index",
    "verbalizer",
    "relativzer/subordinator",
    "verbal negation"
]

params = [
    "comparative",
    "superlative",
    "adjectivizer",
    "adverbializer",
    "clause-level TAM",
    "clause linking",
    "dative",
    "ergative",
    "accusative",
    "miscellaneous peripheral cases",
    "locative",
    "comparative case",
    "animate gender",
    "inanimate noun class",
    "diminutive",
    "augmentative",
    "definite/indefinite",
    "topic",
    "focus",
    "miscellaneous nominalizers",
    "agent nominalizer",
    "abstract nominalizer",
    "social group derivation",
    "place name derivation",
    "plural",
    "dual",
    "singular",
    "paucal",
    "miscellaneous nominal derivation",
    "privative",
    "possessor index",
    "numeral classifier",
    "ordinal numeral derivation",
    "miscellaneous numeral derivation",
    "passive",
    "causative",
    "reflexive",
    "applicative",
    "reciprocal",
    "verbal TAM",
    "miscellaneous verbal derivation",
    "subject/object index",
    "verbalizer",
    "relativzer/subordinator",
    "verbal negation",
]
assert len(params) == len(set(params))

params_map = dict(zip(params, super_params))
for k in params_map:
    if super_params.count(params_map[k]) == 1:
        params_map[k] = None

param_ids = {}
for i, param in enumerate(params + list(set(super_params))):
    param_ids[param] = i + 1

assert len(param_ids.keys()) == len(set(param_ids.keys()))


def maybe_int(value):
    if isinstance(value, float):
        return int(value)
    return value


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
    matrix = xls.sheet_by_name('Sheet1')
    fields = [
        matrix.cell(0, i).value.strip() or xlrd.colname(i) for i in range(matrix.ncols)]
    pfields = [
        matrix.cell(1, i).value or xlrd.colname(i) for i in range(matrix.ncols)]

    for j in range(matrix.nrows):
        values = zip(fields, [matrix.cell(j, i).value for i in range(matrix.ncols)])
        pvalues = zip(pfields, [maybe_int(matrix.cell(j, i).value) for i in range(matrix.ncols)])
        valuesdict = dict(values)
        try:
            rec_attrs = {
                'macroarea': valuesdict['AZ'],
                'iso': valuesdict['BD'],
                'genus': valuesdict['BE']}
            pairs[int(valuesdict['perm.id'])] = pvalues, valuesdict
            languages[valuesdict['Recipient lg.']] = rec_attrs
            if valuesdict['Donor lg.'] not in languages:
                languages[valuesdict['Donor lg.']] = {}
            #print pairs[int(valuesdict['perm.id'])]
        except:
            continue

    id_ = 0
    for name in params:
        id_ += 1
        data.add(models.AffixFunction, name, id=str(id_), name=name)

    for name in filter(None, set(params_map.values())):
        id_ += 1
        data.add(models.AffixFunction, name, id=str(id_), name=name)

    for name in params:
        if params_map[name]:
            data['AffixFunction'][name].superparam = data['AffixFunction'][params_map[name]]

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
                    assert doc['Recipient lg.'] == pairs[id_][1]['Recipient lg.']
                    assert doc['Don'] == pairs[id_][1]['Donor lg.']
                except:
                    print doc['Recipient lg.'], doc['Don']
                    print pairs[id_][1]['Recipient lg.'], pairs[id_][1]['Donor lg.']
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
        kw = dict(name=name, id=str(i+1), jsondata=languages[name])
        if slug(name) in coords:
            kw['latitude'], kw['longitude'] = coords[slug(name)]
        data.add(common.Language, name, **kw)

    refdb = bibtex.Database.from_file(args.data_file('FSeifartsZoteroLibraryOct2013.bib'))
    for rec in refdb:
        if slug(rec.id) in sources:
            data.add(common.Source, slug(rec.id), _obj=bibtex2source(rec))

    dl_pairs = []
    for id_, pair in pairs.items():
        pvalues, vd = pair
        if id_ not in doc:
            continue
        donor = data['Language'][vd['Donor lg.']]
        recipient = data['Language'][vd['Recipient lg.']]
        if (donor, recipient) in dl_pairs:
            print recipient.name, '<', donor.name
            raise ValueError
        dl_pairs.append((donor, recipient))
        p = data.add(
            models.Pair,
            id_,
            id=str(id_),
            name='%s < %s' % (recipient, donor),
            area=recipient.jsondata['macroarea'],
            description=unicode(doc[id_]['comment']),
            reliability=vd['reliab'],
            interrelatedness=int(vd[u'inter\u2011rel.']) if vd[u'inter\u2011rel.'] != '' else None,
            count_affixes=int(vd['F']) if vd[u'F'] != '' else None,
            donor=donor,
            recipient=recipient)
        DBSession.flush()

        super_values = {}
        value = None

        for param in params:
            param_id = param_ids[param]
            value = None
            for k, v in pvalues:
                if k == param:
                    value = v
                    break
            #value = '%s' % pair[param]
            if value:
                if params_map[param]:
                    sp = params_map[param]
                    if sp in super_values:
                        super_values[sp] += v
                    else:
                        super_values[sp] = v
                vsid = '%s-%s' % (recipient.id, param_id)
                if vsid in data['ValueSet']:
                    vs = data['ValueSet'][vsid]
                else:
                    d = dict(
                        id=vsid,
                        parameter=data['AffixFunction'][param],
                        language=recipient,
                        contribution=contrib)
                    vs = data.add(
                        common.ValueSet, vsid, **d)
                data.add(
                    models.waabValue,
                    '%s-%s' % (id_, param_id),
                    id='%s-%s' % (id_, param_id),
                    pair=p,
                    name=value,
                    description='%s' % p,
                    valueset=vs)
        for param, value in super_values.items():
            param_id = param_ids[param]
            vsid = '%s-%s' % (recipient.id, param_id)
            if vsid in data['ValueSet']:
                vs = data['ValueSet'][vsid]
            else:
                d = dict(
                    id=vsid,
                    parameter=data['AffixFunction'][param],
                    language=recipient,
                    contribution=contrib)
                vs = data.add(
                    common.ValueSet, vsid, **d)
            data.add(
                models.waabValue,
                '%s-%s' % (id_, param_id),
                id='%s-%s' % (id_, param_id),
                name=value,
                description='%s' % p,
                pair=p,
                valueset=vs)


def prime_cache(args):
    """If data needs to be denormalized for lookup, do that here.
    This procedure should be separate from the db initialization, because
    it will have to be run periodiucally whenever data has been updated.
    """
    for param in DBSession.query(models.AffixFunction):
        param.representation = len(param.valuesets)
        param.count_subparams = len(param.subparams)

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
        l.update_jsondata(color=colors[max(p.count_affixes for p in l.donor_assocs)])

    for p in DBSession.query(models.Pair):
        for source_id in set(waab.SOURCE_ID_PATTERN.findall(p.description)):
            try:
                p.sources.append(common.Source.get(source_id))
            except:
                print source_id


if __name__ == '__main__':
    initializedb(create=main, prime_cache=prime_cache)
    sys.exit(0)
