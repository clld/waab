# coding: utf8
from __future__ import unicode_literals
import re

from bs4 import BeautifulSoup as bs

from clld.util import slug
from clld.lib import bibtex
from clld.scripts.util import parsed_args


empty_span = '(\s*((\<a name\="\[^\"]+\"\>)|(\<span class\=\"T[0-9]+\"\>\s*\<\/span\>))\s*)*\s*'

pages = '[0-9]+[0-9–,\s]*'
year_pages = '(?P<year>[0-9]{4})(?P<letter>[a-z])?(\:(?P<pages>' + pages + ')(\s+and\s+passim)?)?'
u_year_pages = '[0-9]{4}[a-z]?(\:' + pages + '(\s+and\s+passim)?)?'
mult_year_pages = '(?P<yp>' + u_year_pages + '(;\s*' + u_year_pages + ')*)'
u_mult_year_pages = '(' + u_year_pages + '(;\s*' + u_year_pages + ')*)'

iname = '(\s*de\s+)?([A-Z\xc1\xc7\xd6][\w\u0301]+(\s+|\-|\u2011))*[A-Z\xc1\xc7\xd6][\w\u0301]+(\s+et\s+al\.)?'
name = '(\s+de\s+)?([A-Z\xc1\xc7\xd6][\w\u0301]+(\s+|\-|\u2011))*[A-Z\xc1\xc7\xd6][\w\u0301]+(\s+et\s+al\.)?'
names = '(?P<name>(' + name + ' (and|\&amp\;) )*' + name + ')'
inames = '(?P<name>(' + iname + ' (and|\&amp\;) )*' + name + ')'
u_names = '((' + name + ' (and|\&amp\;) )*' + name + ')'

# name (year:pages+)
p1 = re.compile(names + '(\u2019s)?\s*(\<\/span\>)?' + empty_span + '(\<span class\=\"T[0-9]+\"\>)?\(' + mult_year_pages + '\)?(\<\/span\>)?', re.U)

# ((comment)? name year:pages)
p2 = re.compile('\(((example(s)? from|from|see also)\s+)?' + inames + '\s+' + mult_year_pages + '\)', re.U)

citation = '((citing|see also)\s+)?' + names + '\s+' + year_pages
u_citation = '((citing|see also)\s+)?' + u_names + '\s+' + u_year_pages
p3 = re.compile('\((?P<mult>' + u_citation + '(;\s*' + u_citation + ')+' + ')\)', re.U)

p4 = re.compile(names + '\s*\((?P<year>Forthcoming|In press)(?P<letter>\|)?(?P<pages>\+)?\)')

authors_map = {
    'seguramunguiaandetxebarriaayesta': 'seguramunguiaandayesta',
    'albertborgandazzopardialexander': 'borgandazzopardialexander',
    'neitherappleyard': 'appleyard',
    'sincejanhunenetal': 'janhunenetal',
    'warnke': 'vietzeetal',
    'zavalamaldonado': 'zavala',
    'bolozkoy': 'bolozky',
    'pury': 'depury',
    'boretzki': 'boretzky',
    'bhulanja': 'noonanandbhulanja',
    'alexanderadelaar': 'adelaar',
    'vazquezalvarez': 'vasquezalvarez',
    'korfilt': 'kornfilt',
    'alexanderborg': 'borg',
}

LINKED = {}


def reflink(name, mm, bib):
    name = name.replace('&amp;', 'and')
    name = slug(name)
    name = authors_map.get(name, name)
    if name == 'puscariu' and mm.group('year') == '1943':
        name = 'puscariuandkuen'
    if name == 'mohling' and mm.group('year') == '1986':
        name = 'mohlig'
    if name == 'baht' and mm.group('year') == '1987':
        name = 'bhat'
    if (name, mm.group('year') + (mm.group('letter') or '')) not in bib:
        if (name, mm.group('year')) not in bib:
            print '###', (name, mm.group('year') + (mm.group('letter') or ''))
            return '%s%s%s' % (
                mm.group('year'),
                mm.group('letter') or '',
                ': ' + mm.group('pages') if mm.group('pages') else '')
        else:
            recid = bib[(name, mm.group('year'))]
    else:
        recid = bib[(name, mm.group('year') + (mm.group('letter') or ''))]
    global LINKED
    LINKED[recid] = 1
    return '<a href="__%s__">%s%s</a>%s' % (
        slug(recid),
        mm.group('year'),
        mm.group('letter') or '',
        ': ' + mm.group('pages') if mm.group('pages') else '')


def replace(c, bib):
    n = 0
    new = []
    pos = 0

    for m in p1.finditer(c):
        new.append(c[pos:m.start()])
        s = c[m.start():m.end()]
        # append stuff before the year/pages section
        new.append(s.split('(')[0])
        new.append('(')

        for i, mm in enumerate(re.finditer(year_pages, m.group('yp'))):
            # replace year with link
            #print m.group('name'), mm.group('year'), mm.group('letter'), mm.group('pages')
            if i > 0:
                new.append('; ')
            new.append(reflink(m.group('name'), mm, bib))
            n += 1

        # append stuff before the year/pages section
        if ')' in s:
            new.append(')')
        if s.endswith('</span>'):
            new.append('</span>')
        pos = m.end()
    new.append(c[pos:])

    c = ''.join(new)
    new = []
    pos = 0

    for m in p2.finditer(c):
        new.append(c[pos:m.start()])
        s = c[m.start():m.end()]
        new.append(re.split('[0-9]', s, 1)[0])
        for i, mm in enumerate(re.finditer(year_pages, m.group('yp'))):
            # replace year with link
            #print m.group('name'), mm.group('year'), mm.group('letter'), mm.group('pages')
            if i > 0:
                new.append('; ')
            new.append(reflink(m.group('name'), mm, bib))
            n += 1
        new.append(')')
        pos = m.end()
    new.append(c[pos:])

    c = ''.join(new)
    new = []
    pos = 0

    for m in p3.finditer(c):
        new.append(c[pos:m.start()])
        new.append('(')
        for i, cit in enumerate(m.group('mult').split(';')):
            if i > 0:
                new.append('; ')
            new.append(re.split('[0-9]', cit, 1)[0])
            cit = re.match(citation, cit.strip(), re.U)
            # replace name and year with link
            #print cit.group('name'), mm.group('year'), mm.group('letter'), mm.group('pages')
            new.append(reflink(cit.group('name'), cit, bib))
            n += 1
        new.append(')')
        pos = m.end()
    new.append(c[pos:])

    c = ''.join(new)
    new = []
    pos = 0

    for m in p4.finditer(c):
        new.append(c[pos:m.start()])
        s = c[m.start():m.end()]
        new.append(s.split('(')[0])
        new.append('(')
        new.append(reflink(m.group('name'), m, bib))
        n += 1
        new.append(')')
        pos = m.end()
    new.append(c[pos:])

    print n
    return ''.join(new)


def text(n):
    return ' '.join(list(n.stripped_strings))


def get_cite_name(authors):
    authors = authors.lower()
    if ', and ' in authors:
        afirst, alast = authors.split(', and ')
        parts = afirst.split(',')
        if len(parts) > 2:
            # Janhunen, Juha, Marja Peltomaa, Erika Sandman, and Xiawu Dongzhou
            return '%s et al.' % parts[0]
        else:
            # Goswami, G. C., and Jyotiprakash Tamuli
            return '%s and %s' % (parts[0], ' '.join(alast.split()[-1:]))
    else:
        # Fuchs, David R
        return authors.split(',')[0]


def get_normalized_name(authors):
    authors = authors.lower()
    if ', and ' in authors:
        afirst, alast = authors.split(', and ')
        parts = afirst.split(',', 2)
        if len(parts) > 2:
            # Janhunen, Juha, Marja Peltomaa, Erika Sandman, and Xiawu Dongzhou
            return slug(parts[1] + parts[0] + parts[2] + alast)
        else:
            # Goswami, G. C., and Jyotiprakash Tamuli
            return slug(parts[1] + parts[0] + alast)
    else:
        # Fuchs, David R
        last, first = authors.split(',')
        return slug(first + last)


BIB = {}


def get_bib(soup, refdb):
    title_sep = re.compile('\.|\?')

    def normalize_refdb(name):
        if ',' in name:
            last, first = name.split(',', 1)
        else:
            last, first = name, ''
        return slug(first + last)

    def normalize_bib(name):
        return filter(None, [slug(n.strip()) for n in name.split(' and ')])

    recids = [rec.id for rec in refdb]
    assert len(set(recids)) == len(set(map(slug, recids)))
    refmap = {}
    for rec in refdb:
        title = rec.get('title', rec.get('booktitle', 'xxx'))
        authors = map(normalize_refdb, rec.get('author', rec.get('editor', 'xxx')).split(' and '))
        refmap[rec.id] = (slug(''.join(authors)), rec.get('year', 'noyear'), slug(title_sep.split(title)[0]))

    res = {
        (u'weinreich', u'1953'): 'weinreich_languages_1953',
        (u'sandfeld', u'1938'): 'sandfeld_problemes_1938',
        (u'capidan', u'1940'): 'capidan_bilinguisme_1940',
        ### (u'baht', u'1987')
        (u'hualdeandurbina', u'2003'): 'hualde_grammar_2003',
    }

    global BIB
    name = None
    for p in soup.find_all('p', **{'class': re.compile('P300')}):
        ref = text(p)
        if 'Forthcoming.' in ref or 'In press.' in ref:
            author, year, rem = re.split('\s*\.?\s*(Forthcoming|In press)\.', ref, 1)
        else:
            try:
                author, year, rem = re.split('\s*([0-9]{4}[a-z]?)\.\s*', ref, 1)
            except:
                print ref
                raise
        if author != '---':
            if author.endswith('.'):
                author = author[:-1]
            name = author
        #print name, year, rem.split('.')[0]
        rauthors = get_normalized_name(name)
        ryear = year[:4] if year not in ['Forthcoming', 'In press'] else 'noyear'
        rtitle = slug(title_sep.split(rem)[0])
        rec = None
        for recid, spec in refmap.items():
            if spec == (rauthors, ryear, rtitle):
                rec = recid
                break
        try:
            assert rec
        except AssertionError:
            print ref
        res[(slug(get_cite_name(name)), year)] = rec
        if rec in BIB:
            BIB[rec].append(ref)
        else:
            BIB[rec] = [ref]
    return res


def main(args):
    c = file(args.data_file('MB_Case_List.html')).read().decode('utf8')
    c = c.replace('Roth 1979; 2003', 'Roth 1979; Roth 2003')
    c = c.replace('; see also Adelaar 2005; 2009; 2010)', ') (see also Adelaar 2005; Adelaar 2009; Adelaar 2010)')
    c = c.replace('Adelaar (1987; see also 1996:1328)', 'Adelaar (1987) (see also Adelaar 1996:1328)')
    c = c.replace('; see also ', ') (see also ')
    c = c.replace('(de Reuse', '( de Reuse')
    c = c.replace('Bulut (2005; 2007; In press)', 'Bulut (2005; 2007) and Bulut (In press)')

    refdb = bibtex.Database.from_file(args.data_file('FSeifartZoteroLibrary14Nov2013.bib'))
    bib = get_bib(bs(c), refdb)

    with open(args.data_file('MB_Case_List_with_links.html'), 'w') as fp:
        fp.write(replace(c, bib).encode('utf8'))
    print len(LINKED)
    for recid in BIB:
        if recid not in LINKED:
            print BIB[recid]


if __name__ == '__main__':
    main(parsed_args())
