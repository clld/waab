from __future__ import unicode_literals

from clld.web.adapters.geojson import GeoJsonParameter
from clld.web.adapters.download import CsvDump
from clld.interfaces import IParameter
from clld.db.meta import DBSession
from clld.db.models.common import Parameter

from waab.models import Pair


class GeoJsonAffixFunction(GeoJsonParameter):
    def feature_properties(self, ctx, req, valueset):
        return {'label': '%s: %s' % (
            valueset.language, ', '.join(v.format() for v in valueset.values))}


class Matrix(CsvDump):
    md_fields = [
        ('ID', lambda p: None),
        ('Recipient name', lambda p: p.recipient.name),
        ('Recipient glottocode', lambda p: p.recipient.glottocode),
        ('Recipient iso639-3', lambda p: p.recipient.iso_code),
        ('Recipient genus', lambda p: p.recipient.jsondatadict.get('genus')),
        ('Donor name', lambda p: p.donor.name),
        ('Donor glottocode', lambda p: p.donor.glottocode),
        ('Donor iso639-3', lambda p: p.donor.iso_code),
        ('Donor genus', lambda p: p.donor.jsondatadict.get('genus')),
        ('reliability', lambda p: p.reliability),
        ('number of interrelated affixes', lambda p: p.count_interrel),
        ('number of borrowed affixes', lambda p: p.count_borrowed),
        ('Area', lambda p: p.area),
        ('References', lambda p: ', '.join(s.id for s in p.sources)),
    ]

    def get_fields(self, req):  # pragma: no cover
        res = [f[0] for f in self.md_fields]
        res.extend([p.name for p in DBSession.query(Parameter).order_by(Parameter.pk)])
        return res

    def row(self, req, fp, item, index):  # pragma: no cover
        values = {v.valueset.parameter.name: v.numeric for v in item.values}
        for name, getter in self.md_fields:
            values[name] = getter(item) or ''
        values['ID'] = req.resource_url(item)
        return [values.get(p, '') for p in self.get_fields(req)]


def includeme(config):
    config.register_download(Matrix(Pair, 'waab', description='AFBO value matrix'))
    config.register_adapter(GeoJsonAffixFunction, IParameter)
