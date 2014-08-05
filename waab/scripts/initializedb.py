# coding: utf8
# flake8: noqa
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
from waab.scripts import citations


citation = re.compile('\[(?P<ids>[0-9]{1,3}(,\s*[0-9]{1,3})*)\]')
GC = create_engine('postgresql://robert@/glottolog3')

glottocodes = {}
glottocoords = {}
glottonames = {}
rglottonames = {}
for row in GC.execute('select ll.hid, l.id, l.latitude, l.longitude, l.name from language as l, languoid as ll where ll.pk = l.pk'):
    if row[0] and len(row[0]) == 3:
        rglottonames[slug(row[4])] = row[0]
        glottocodes[row[0]] = row[1]
        glottonames[row[0]] = row[4]
        if row[2] != None:
            glottocoords[row[0]] = (row[2], row[3])


def text(n):
    return ' '.join(list(n.stripped_strings))


COORDS = {
    'Alabama and Choctaw‑Chickasaw': (35.23888888888889, -96.23972222222223),
    'Carapana, Tatuyo, Wáimaja, and Yurutí': (0.92, -71.42),
    'Central Mexicano Nahuatl': (18.7475, -99.07027777777778),
    'Chinese of Línxìa/Hézōu': (35.6, 103.21666666666667),
    'Cho’ol': (17.3, -92.43333333333334),
    'Ilwana': (-0.4569444444444445, 39.65833333333333),
    'Dagur': (48, 124),
    'German': (56.94888888888889, 24.10638888888889),
    'Hungarian': (45.82527777777778, 17.822222222222223),
    'Ingrian Finnish': (59.916666666666664, 29.766666666666666),
    'Judeo‑Spanish': (41.01361111111111, 28.955),
    'Mexicanero de la Sierra Madre Occidental': (24.934722222222224, -104.91194444444444),
    'Middle English': (51.5072, -0.1275),
    'Middle Mongolic': (46.0000, 105.0000),
    'Moroccan Arabic': (34.03333333333333, -6.833333333333333),
    'Purepecha/Tarascan': (19.5, -101.75),
    'Sebjan‑Küöl Ėven': (66.41666666666667, 128.41666666666666),
    'Sonqor Turkic': (34.783611111111114, 47.60027777777778),
    'Hasankeyf Arabic': (37.714108333333336, 41.41316666666667),
    'Uchur Ėvenki': (56, 125),
    'Wayampi‑Emerillon‑Zo’é': (3.25, -52.33),
    'Western Kurmanji': (38.833333333333336, 43.833333333333336),
    'Western Neo‑Aramaic of Ma’lūla': (33.844166666666666, 36.54666666666667),
}


def main(args):
    citations.main(args)
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
    md = "area\trecipient language iso\trecipient language genus\tdonor language iso\tdonor language genus".split('\t')

    fields = []
    params = []
    for i in range(matrix.ncols):
        colname = xlrd.colname(i)
        if len(colname) == 2 and colname > 'BE':
            break
        colval = matrix.cell(0, i).value.strip()
        if (len(colname) == 1 and colname > 'G') or (len(colname) == 2 and colname < 'AY'):
            params.append(colval)
            fields.append(colval)
        else:
            fields.append(colval.lower())

    for f in fields:
        if fields.count(f) > 1:
            print f

    assert len(fields) == len(set(fields))

    for j in range(1, matrix.nrows):
        values = dict(zip(fields, [matrix.cell(j, i).value for i in range(matrix.ncols)]))
        try:
            id_ = int(values['perm.id'])
        except:
            continue

        pairs[id_] = values
        for type_ in ['recipient', 'donor']:
            languages[values[type_ + ' language'].strip()] = {
                'macroarea': values['area']}
            for md in ['iso', 'genus']:
                languages[values[type_ + ' language'].strip()][md] \
                    = values['%s language %s' % (type_, md)]

    for name in COORDS:
        assert name in languages

    sources = {}
    with open(args.data_file('MB_Case_List_with_links.html')) as fp:
        worddoc = fp.read()
        for m in re.finditer('\"__(?P<recid>[^_]+)__\"', worddoc):
            sources[m.group('recid').decode('utf8')] = 1
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
                assert doc['Recipient lg.'] == pairs[id_][1]['recipient language']
                assert doc['Don'] == pairs[id_][1]['donor language']
        except:
            continue

    dataset = common.Dataset(
        id='afbo',
        name="AfBo: A world-wide survey of affix borrowing",
        contact="frank_seifart@eva.mpg.de",
        domain="afbo.info",
        license='http://creativecommons.org/licenses/by/3.0/',
        jsondata={
            'license_icon': 'cc-by.png',
            'license_name': 'Creative Commons Attribution 3.0 Unported License'})

    DBSession.add(dataset)
    for i, spec in enumerate([('seifart', "Frank Seifart")]):
        DBSession.add(common.Editor(
            dataset=dataset,
            ord=i + 1,
            contributor=common.Contributor(id=spec[0], name=spec[1])))

    contrib = data.add(common.Contribution, 'afbo', name="AfBo", id="afbo")

    iso_map = {
        ('ron', 'Meglenite Romanian'): ('ruq', None),
        ('fra', 'Norman French'): ('xno', None),
        ('tur', 'Turkic'): (None, 'turk1311'),
        ('xuu', 'Kxoe languages'): (None, 'khoe1241'),
        ('zoc', 'Zoquean languages'): (None, 'zoqu1261'),
        ('tzm', 'Moroccan Berber languages'): (None, 'atla1275'),
        ('cvn', 'Quechua'): ('qvn', None),
        ('rop', 'Gurindji Kriol'): (None, 'guri1249'),
        ('ita', 'Sicilian Italian'): ('scn', None),
        ('srp', 'Croatian'): ('hrv', None),
        ('eme', 'Wayampi‑Emerillon‑Zo’é'): (None, 'waya1271'),
        ('ale', 'Copper Island Aleut'): ('mud', None),
        ('car', 'intermediate Proto‑Carib'): (None, 'cari1283'),
        ('ell', 'Cappadocian Greek'): ('cpg', None),
        ('eng', 'Middle English'): ('enm', None),
        ('als', 'Arvanitic Albanian'): ('aat', None),
        ('nys', 'Northern Nyungic'): (None, 'dese1234'),
        ('ron', 'Istro‑Romanian'): ('ruo', None),
        ('chf', 'Cho’ol'): ('ctu', None),
        ('tuo', 'Eastern Tucanoan languages'): (None, 'east2698'),
        ('ceb', 'Visayan'): (None, 'bisa1268'),
        ('por', 'Sri Lanka Portuguese'): (None, 'mala1544'),
        ('brx', 'Tibeto-Burman languages'): (None, 'brah1260'),
    }

    with open('name_conflicts.tab', 'w') as fp:
        fp.write('iso\tafbo\tglottolog\tproposed iso\n')
        for i, name in enumerate(languages.keys()):
            md = languages[name]
            iso = md.pop('iso')
            if iso == 'cvn' and name == 'Quechua':
                iso = 'qvn'
            kw = dict(name=name, id=str(i+1), jsondata=md)
            if name in COORDS:
                kw['latitude'], kw['longitude'] = COORDS[name]
            elif slug(name) in coords:
                kw['latitude'], kw['longitude'] = coords[slug(name)]
            elif glottocoords.get(iso):
                kw['latitude'], kw['longitude'] = glottocoords[iso]

            if glottonames.get(iso) and slug(glottonames.get(iso)) != slug(name):
                fp.write(('%s\t%s\t%s\t%s\n' % (
                    iso, name, glottonames.get(iso), rglottonames.get(slug(name), ''))).encode('utf8'))

            if name == 'Meglenite Romanian':
                kw['name'] = 'Megleno Romanian'
            if not 'latitude' in kw:
                print name
            l = data.add(common.Language, name, **kw)

            iso, gc = iso_map.get((iso, name), (iso, None))

            for code, type_ in [
                (iso, common.IdentifierType.iso),
                (gc or glottocodes.get(iso), common.IdentifierType.glottolog)
            ]:
                if code:
                    identifier = data.add(
                        common.Identifier, code, id=code, name=code, type=type_.value)
                    data.add(
                        common.LanguageIdentifier, '%s-%s' % (code, l.id),
                        identifier=identifier, language=l)

    include = sources.keys() + [
        'myersscottoncontact2002', 'myersscottonlanguage2007',
        'meakinsborrowing2011', 'seifartprinciple2012',
    ]
    refdb = bibtex.Database.from_file(args.data_file('FSeifartZoteroLibrary14Nov2013.bib'))
    for rec in refdb:
        if slug(rec.id) in include:
            data.add(common.Source, slug(rec.id), _obj=bibtex2source(rec))

    for i, name in enumerate(params):
        data.add(models.AffixFunction, name, id=str(i + 1), name=name)

    for id_, vd in pairs.items():
        assert id_ in doc

        donor = data['Language'][vd['donor language'].strip()]
        recipient = data['Language'][vd['recipient language'].strip()]

        p = data.add(
            models.Pair,
            id_,
            id=str(id_),
            name=vd['pairs'].replace('Meglenite', 'Megleno'),
            area=recipient.jsondata['macroarea'],
            description=unicode(doc[id_]['comment']).replace('<h1', '<p').replace('</h1>', '</p>').replace('Meglenite', 'Megleno'),
            reliability=vd['reliability'],
            int_reliability=['high', 'mid', 'low'].index(vd['reliability']),
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
    for color in colors.values() + ['ffffff']:
        figure(figsize=(0.4, 0.4))
        axes([0.1, 0.1, 0.8, 0.8])
        coll = pie((100,), colors=('#' + color,))
        coll[0][0].set_linewidth(0.5)
        savefig(icons_dir.joinpath('%s.png' % color), transparent=True)

    for l in DBSession.query(common.Language)\
            .join(models.Pair, common.Language.pk == models.Pair.recipient_pk):
        l.update_jsondata(color=colors[max(p.count_borrowed for p in l.donor_assocs)])

    for l in DBSession.query(common.Language):
        if not l.donor_assocs:
            l.update_jsondata(color='ffffff')

    for p in DBSession.query(models.Pair):
        for source_id in set(waab.SOURCE_ID_PATTERN.findall(p.description)):
            try:
                p.sources.append(common.Source.get(source_id))
            except:
                print source_id


if __name__ == '__main__':
    initializedb(create=main, prime_cache=prime_cache)
    sys.exit(0)
