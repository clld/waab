import re

from clld.web.util.helpers import link
from clld.db.models.common import Source


citation = re.compile('\*\*(?P<id>[^\*]+)\*\*')


def description(req, d):
    while citation.search(d):
        d = citation.sub(lambda m: link(req, Source.get(m.group('id'))), d)
    return d
