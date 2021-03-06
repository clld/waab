from functools import partial
import re

from pyramid.config import Configurator

from clld.web.app import menu_item, MapMarker
from clld.web.adapters.download import Download
from clld.interfaces import IMapMarker, ILanguage, IValueSet
from clld.db.models.common import Source

# we must make sure custom models are known at database initialization!
from waab import models
from waab.interfaces import IPair


_ = lambda s: s
_('Pair')
_('Pairs')
_('Parameter')
_('Parameters')
_('Source')
_('Sources')
_('Languages')


SOURCE_ID_PATTERN = re.compile('__(?P<id>[a-z0-9]+)__')
COLOR_MAP = [
    (10, None, '8b4512'),
    (5, 9, 'cd661c'),
    (2, 4, 'ee7620'),
    (None, 1, 'ff7f24'),
]


class waabMapMarker(MapMarker):
    def __call__(self, ctx, req):
        c = None
        if ILanguage.providedBy(ctx):
            c = ctx.jsondata.get('color')
        elif IValueSet.providedBy(ctx):
            c = ctx.language.jsondata.get('color')

        if c:
            return req.static_url('waab:static/%s.png' % c)

        return super(waabMapMarker, self).__call__(ctx, req)  # pragma: no cover


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    settings['sitemaps'] = 'pair parameter source'.split()
    config = Configurator(settings=settings)
    config.include('clldmpg')
    config.registry.registerUtility(waabMapMarker(), IMapMarker)
    config.register_resource('pair', models.Pair, IPair, with_index=True)
    config.register_menu(
        ('dataset', partial(menu_item, 'dataset', label='Home')),
        ('about', lambda c, r: (r.route_url('about'), 'About')),
        ('languages', partial(menu_item, 'languages')),
        ('pairs', partial(menu_item, 'pairs')),
        ('parameters', partial(menu_item, 'parameters')),
        ('sources', partial(menu_item, 'sources')),
    )
    config.register_download(Download(
        Source, 'waab', ext='bib', description="Sources as BibTeX"))

    return config.make_wsgi_app()
