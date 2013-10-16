from __future__ import unicode_literals
import sys

import xlrd
from bs4 import BeautifulSoup as bs
from clld.scripts.util import initializedb, Data
from clld.db.meta import DBSession
from clld.db.models import common

import waab
from waab import models


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

    with open(args.data_file('MB_Case_List.html')) as fp:
        soup = bs(fp.read())

    def text(n):
        return ' '.join(list(n.stripped_strings))

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

    for id_, pair in pairs.items():
        donor = data['Language'][pair['Donor lg.']]
        recipient = data['Language'][pair['Recipient lg.']]
        p = data.add(
            models.Pair,
            id_,
            id=str(id_),
            name='%s -> %s' % (donor, recipient),
            description=unicode(doc[id_]['comment']),
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
