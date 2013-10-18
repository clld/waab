from __future__ import unicode_literals
import sys
import re

import xlrd
from bs4 import BeautifulSoup as bs
from clld.scripts.util import initializedb, Data, bibtex2source
from clld.db.meta import DBSession
from clld.db.models import common
from clld.util import slug
from clld.lib import bibtex

import waab
from waab import models


citation = re.compile('\[(?P<ids>[0-9]{1,3}(,\s*[0-9]{1,3})*)\]')


def linked_refs(doc, bib):
    """
    TODO:
    - parse refs from zotero bib
    - parse refs from bibliography in doc
    - identify
    - parse citations and link them
    """
    def repl(match):
        ids = ['**' + bib[i.strip()].id + '**' for i in match.group('ids').split(',')]
        return '[%s]' % ', '.join(ids)

    doc = unicode(doc)
    while citation.search(doc):
        doc = citation.sub(repl, doc)
    return doc


def text(n):
    return ' '.join(list(n.stripped_strings))


def get_bib(args, soup):
    def normalize_refdb(name):
        if ',' in name:
            last, first = name.split(',', 1)
        else:
            last, first = name, ''
        return slug('. '.join(
            slug(t)[0] for t in re.split('\s+|\.', first.strip()) if slug(t)) + last.strip())

    def normalize_bib(name):
        return filter(None, [slug(n.strip()) for n in name.split(' and ')])

    mapping = {
        '53': 'vellard_contribucion_1967',
        '55': 'cohen_hebrew_2012',
        '56': 'schwarzwald_inflection_1998',
        '108': 'bulut_turkic_????',
        '143': 'parker_jones_loanwords_2009',
        '155': 'sasse_sprachkontakt_1985',
        '156': 'sasse_arvanitika._1991',
        '200': 'varol-bornes_judeo-espagnol_2008',
        '218': 'zavala_oraciones_2007',
    }

    refdb = bibtex.Database.from_file(args.data_file('FSeifartsZoteroLibraryOct2013.bib'))
    refmap = {}
    for rec in refdb:
        if not rec.genre:
            print rec
        if rec.genre.value == 'article':
            title = rec.get('journal', '') + rec.get('volume', '')
        elif rec.genre.value in ['unpublished', 'misc']:
            title = rec.get('year', 'xxx')
        else:
            if rec.get('booktitle'):
                title = 'in ' + rec['booktitle']
            else:
                title = rec.get('title', 'xxx')
        authors = map(normalize_refdb, rec.get('author', rec.get('editor', 'xxx')).split(' and '))

        fmt = ''
        for i, name in enumerate(authors):
            if i > 0 and i == len(authors) - 1:
                fmt += 'and'
            fmt += name

        refmap[rec.id] = slug(fmt + title.split(',')[0].split('(')[0])
    res = {}
    for p in soup.find_all('p', **{'class': 'P360'}):
        ref = text(p)
        match = citation.match(ref)
        if match:
            if match.group('ids') in mapping:
                res[match.group('ids')] = refdb[mapping[match.group('ids')]]
            else:
                _ref = slug(ref[match.end():])

                found = False
                for key, data in refmap.items():
                    if _ref.startswith(data):
                        #print ref.encode('utf8')
                        #print unicode(refdb[key]).encode('utf8')
                        #print data.encode('utf8')
                        #print
                        found = True
                        break

                if not found:
                    print '---!'
                    print ref.encode('utf8')
                    print _ref.encode('utf8')

                res[match.group('ids')] = refdb[key]
    return res


def main(args):
    data = Data()

    pairs = {}
    languages = {}

    xls = xlrd.open_workbook(args.data_file('MB_BoCatSum.xlsx'))
    matrix = xls.sheet_by_name('Master Sheet')
    fields = [matrix.cell(0, i).value.strip() for i in range(matrix.ncols)]
    #
    # TODO: there are ambiguous column headings, e.g. "dat".
    #
    params = set(filter(lambda n: n and n not in ['perm.id', 'Recipient lg.', 'Donor lg.'], fields))
    for j in range(matrix.nrows):
        values = dict(zip(fields, [matrix.cell(j, i).value for i in range(matrix.ncols)]))
        try:
            pairs[int(values['perm.id'])] = values
            languages[values['Recipient lg.']] = 1
            languages[values['Donor lg.']] = 1
        except:
            continue

    for i, name in enumerate(params):
        data.add(common.Parameter, name, id=str(i+1), name=name)

    with open(args.data_file('MB_Case_List_AmericPhysics.html')) as fp:
        soup = bs(fp.read())

    bib = get_bib(args, soup)

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
                    assert doc['Recipient lg.'] == pairs[id_]['Recipient lg.']
                    assert doc['Don'] == pairs[id_]['Donor lg.']
                except:
                    print doc['Recipient lg.'], doc['Don']
                    print pairs[id_]['Recipient lg.'], pairs[id_]['Donor lg.']
            else:
                print "----!---", id_
            #print id_, id_ in pairs
        except:
            continue

    dataset = common.Dataset(
        id=waab.__name__,
        name="World Atlas of Affix Borrowing",
        domain="waab.clld.org")
    DBSession.add(dataset)

    contrib = data.add(common.Contribution, 'waab', name="waab", id="waab")

    for i, name in enumerate(languages.keys()):
        data.add(common.Language, name, name=name, id=str(i+1))

    #
    # TODO: mapping multiple entried in the bibliography to the same record in the zotero
    # bib means there's something wrong!
    #
    created = {}
    for no, rec in bib.items():
        if rec.id in created:
            data['Source'][no] = data['Source'][created[rec.id]]
        else:
            data.add(common.Source, no, _obj=bibtex2source(rec))
            created[rec.id] = no

    for id_, pair in pairs.items():
        donor = data['Language'][pair['Donor lg.']]
        recipient = data['Language'][pair['Recipient lg.']]
        p = data.add(
            models.Pair,
            id_,
            id=str(id_),
            name='%s -> %s' % (donor, recipient),
            description=linked_refs(doc[id_]['comment'], data['Source']),
            donor=donor,
            recipient=recipient)
        DBSession.flush()
        for i, param in enumerate(params):
            value = '%s' % pair[param]
            if value:
                d = dict(
                    id='%s-%s' % (id_, i + 1),
                    description=value,
                    parameter=data['Parameter'][param],
                    language=recipient,
                    contribution=contrib,
                    pair=p)
                vs = data.add(
                    models.waabValueSet, '%s-%s' % (id_, i + 1), **d)
                data.add(
                    common.Value,
                    '%s-%s' % (id_, i + 1),
                    id='%s-%s' % (id_, i + 1),
                    name=value,
                    valueset=vs)


def prime_cache(args):
    """If data needs to be denormalized for lookup, do that here.
    This procedure should be separate from the db initialization, because
    it will have to be run periodiucally whenever data has been updated.
    """


if __name__ == '__main__':
    initializedb(create=main, prime_cache=prime_cache)
    sys.exit(0)
