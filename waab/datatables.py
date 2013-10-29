from sqlalchemy import Integer
from sqlalchemy.sql.expression import cast
from sqlalchemy.orm import aliased, joinedload

from clld.db.models.common import Language, Value, Parameter, ValueSet, Source
from clld.db.util import icontains, get_distinct_values
from clld.web.datatables.base import (
    Col, LinkCol, DataTable, filter_number, LinkToMapCol,
)
from clld.web.datatables.parameter import Parameters
from clld.web.datatables.source import Sources
from clld.web.datatables.value import Values
from clld.web.util.htmllib import HTML
from clld.web.util.helpers import link

from waab.models import Pair, AffixFunction, waabValue


class AffixFunctions(Parameters):
    def col_defs(self):
        return [
            LinkCol(self, 'name', sTitle='Affix function'),
            Col(self, 'count_borrowed',
                sTitle='total number of borrowed affixes',
                model_col=AffixFunction.count_borrowed),
            Col(self, 'representation',
                sTitle='number of languages that borrowed affixes with this function',
                model_col=AffixFunction.representation),
        ]


class DetailsCol(LinkCol):
    def get_attrs(self, item):
        return {'label': 'details'}


class DonorCol(LinkCol):
    def get_obj(self, item):
        return item.donor

    def search(self, qs):
        return icontains(self.dt.donor.name, qs)

    def order(self):
        return self.dt.donor.name


class RecipientCol(LinkCol):
    def get_obj(self, item):
        return item.recipient

    def search(self, qs):
        return icontains(self.dt.recipient.name, qs)

    def order(self):
        return self.dt.recipient.name


class Pairs(DataTable):
    def __init__(self, *args, **kw):
        super(Pairs, self).__init__(*args, **kw)
        self.donor = aliased(Language)
        self.recipient = aliased(Language)

    def base_query(self, query):
        return query\
            .join(self.donor, self.donor.pk == Pair.donor_pk)\
            .join(self.recipient, self.recipient.pk == Pair.recipient_pk)

    def col_defs(self):
        return [
            RecipientCol(self, 'recipient', sTitle='Recipient language'),
            DonorCol(self, 'donor', sTitle='Source language'),
            Col(self, 'count_borrowed', sTitle='# affixes', sDescription='Number of borrowed affixes'),
            Col(self, 'count_interrel', sTitle='# interrel. aff.', sDescription='Number of interrelated borrowed affixes'),
            Col(self, 'area', choices=get_distinct_values(Pair.area)),
            Col(self, 'reliability', choices=get_distinct_values(Pair.reliability)),
            LinkCol(self, 'details', model_col=Pair.name),
        ]

    def get_options(self):
        return {"iDisplayLength": 200}


class ReferencedInCol(Col):
    def format(self, item):
        return HTML.ul(
            *[HTML.li(link(self.dt.req, pair)) for pair in item.pairs],
            class_="unstyled")


class References(Sources):
    def base_query(self, query):
        query = Sources.base_query(self, query)
        return query.options(joinedload(Source.pairs))

    def col_defs(self):
        return [
            Col(self, 'author'),
            Col(self, 'year'),
            Col(self, 'title'),
            ReferencedInCol(self, 'referenced_in', bSearchable=False, bSortable=False),
            DetailsCol(self, 'details', bSearchable=False, bSortable=False),
        ]

    def get_options(self):
        return {'aaSorting': [[0, 'asc'], [1, 'asc']]}


class ValueCol(Col):
    __kw__ = {
        'sClass': 'right',
        'sTitle': '# affixes',
        'input_size': 'mini',
        'sDescription': 'Number of [affix function] affixes borrowed'}

    def format(self, item):
        return int(item.name)

    def search(self, qs):
        return filter_number(cast(Value.name, Integer), qs, type_=int)

    def order(self):
        return cast(Value.name, Integer)


class waabValues(Values):
    def __init__(self, req, model, parameter=None, pair=None):
        Values.__init__(self, req, model, parameter=parameter)

        if pair:
            self.pair = pair
        elif 'pair' in req.params:
            self.pair = Pair.get(req.params['pair'])
        else:
            self.pair = None

    def base_query(self, query):
        query = Values.base_query(self, query)
        if self.pair:
            query = query.join(ValueSet.parameter)
            return query.filter(waabValue.pair_pk == self.pair.pk)
        if self.parameter:
            return query.join(waabValue.pair)
        return query

    def col_defs(self):
        if self.parameter:
            return [
                LinkCol(self, 'language', get_obj=lambda i: i.pair, model_col=Pair.name),
                ValueCol(self, 'value', sTitle='number of borrowed affixes'),
                LinkToMapCol(self, 'm', get_obj=lambda i: i.pair.recipient)]
        if self.pair:
            return [
                LinkCol(
                    self, 'affix_function',
                    sTitle='Affix function',
                    get_obj=lambda i: i.valueset.parameter,
                    model_col=Parameter.name),
                ValueCol(self, 'value', sTitle='number of borrowed affixes')]
        return []

    def xhr_query(self):
        res = Values.xhr_query(self) or {}
        if self.pair:
            res['pair'] = self.pair.id
        return res

    def get_options(self):
        if self.pair or self.parameter:
            return {'bPaginate': False}


def includeme(config):
    config.register_datatable('parameters', AffixFunctions)
    config.register_datatable('pairs', Pairs)
    config.register_datatable('sources', References)
    config.register_datatable('values', waabValues)
