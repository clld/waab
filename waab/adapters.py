from __future__ import unicode_literals

from clld.web.adapters.geojson import GeoJsonParameter, GeoJsonLanguages
from clld.interfaces import IParameter, IDataset, IRepresentation
from clld.db.meta import DBSession
from clld.db.models.common import Language

from waab.models import Pair


class GeoJsonAffixFunction(GeoJsonParameter):
    def feature_properties(self, ctx, req, valueset):
        return {'label': '%s: %s' % (valueset.language, ', '.join(v.__unicode__() for v in valueset.values))}


class GeoJsonRecipientLanguages(GeoJsonLanguages):
    """Render a collection of languages as geojson feature collection.
    """
    def feature_iterator(self, ctx, req):
        return DBSession.query(Language)\
            .join(Pair, Language.pk == Pair.recipient_pk).distinct()


def includeme(config):
    config.register_adapter(GeoJsonAffixFunction, IParameter)
    config.register_adapter(GeoJsonRecipientLanguages, IDataset, IRepresentation)
