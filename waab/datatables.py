from sqlalchemy import Integer
from sqlalchemy.sql.expression import cast
from sqlalchemy.orm import aliased

from clld.db.models.common import Language, Value, Parameter, ValueSet
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


class ToggleSuperParamsCol(LinkCol):
    choices = [('0', 'hide specific functions'), ('1', 'hide general functions')]

    def search(self, qs):
        if qs == '0':
            # hide params with superparam:
            return AffixFunction.superparam_pk == None
        elif qs == '1':
            # hide superparams:
            return AffixFunction.count_subparams == 0


class AffixFunctions(Parameters):
    def col_defs(self):
        return [
            LinkCol(self, 'name', sTitle='Affix function'),
            ToggleSuperParamsCol(
                self, 'toggle_superparams',
                sTitle='General function',
                get_obj=lambda i: i.superparam),
            Col(self, 'representation',
                sTitle='# languages',
                sDescription='Number of languages that borrowed [affix function name] affixes',
                model_col=AffixFunction.representation)]


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
            Col(self, 'count_affixes', sTitle='# affixes', sDescription='Number of borrowed affixes'),
            Col(self, 'interrelatedness', sTitle='# interrel. aff.', sDescription='Number of interrelated borrowed affixes'),
            Col(self, 'area', choices=get_distinct_values(Pair.area)),
            Col(self, 'reliability', choices=get_distinct_values(Pair.reliability)),
            DetailsCol(self, 'details', bSearchable=False, bSortable=False),
        ]

    def get_options(self):
        return {"iDisplayLength": 200}


class ReferencedInCol(Col):
    def format(self, item):
        return HTML.ul(
            *[HTML.li(link(self.dt.req, pair)) for pair in item.pairs],
            class_="unstyled")


class References(Sources):
    def col_defs(self):
        return [
            Col(self, 'author'),
            Col(self, 'year'),
            Col(self, 'title'),
            ReferencedInCol(self, 'referenced_in', bSearchable=False, bSortable=False),
            DetailsCol(self, 'details', bSearchable=False, bSortable=False),
        ]


#
# TODO: recipient language specific value table!!
#
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


class ReferencesCol(Col):
    def format(self, item):
        return HTML.ul(
            *[HTML.li(link(self.dt.req, source)) for source in item.pair.sources],
            class_="unstyled")


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
        return query

    def col_defs(self):
        if self.parameter:
            res = [LinkCol(self, 'recipient_language', get_obj=lambda i: i.pair)]
        elif self.pair:
            res = [
                LinkCol(
                    self, 'affix_function',
                    sTitle='Affix function',
                    get_obj=lambda i: i.valueset.parameter,
                    model_col=Parameter.name),
                ToggleSuperParamsCol(
                    self, 'toggle_superparams',
                    sTitle='General function',
                    get_obj=lambda i: i.valueset.parameter.superparam)]
        else:
            res = []
        res.append(ValueCol(self, 'value'))
        if self.parameter:
            res.append(ReferencesCol(self, 'references'))
            res.append(LinkToMapCol(self, 'm', get_obj=lambda i: i.pair.recipient))
        return res

    def xhr_query(self):
        res = Values.xhr_query(self) or {}
        if self.pair:
            res['pair'] = self.pair.id
        return res


def includeme(config):
    config.register_datatable('parameters', AffixFunctions)
    config.register_datatable('pairs', Pairs)
    config.register_datatable('sources', References)
    config.register_datatable('values', waabValues)
