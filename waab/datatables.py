from sqlalchemy.orm import aliased

from clld.db.models.common import Language
from clld.db.util import icontains
from clld.web.datatables.base import (
    Col, LinkCol, DataTable,
)
from clld.web.datatables.parameter import Parameters
from waab.models import Pair, AffixFunction


class AffixFunctions(Parameters):
    def col_defs(self):
        return [
            LinkCol(self, 'name'),
            Col(self, 'representation', model_col=AffixFunction.representation)]


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
            RecipientCol(self, 'recipient'),
            DonorCol(self, 'donor'),
            Col(self, 'count_affixes'),
            Col(self, 'interrelatedness'),
            Col(self, 'reliability'),
            DetailsCol(self, '', bSearchable=False, bSortable=False),
        ]


#
# TODO: recipient language specific value table!!
#
