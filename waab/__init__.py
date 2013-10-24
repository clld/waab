from functools import partial
import re

from clld.web.app import get_configurator, menu_item, MapMarker
from clld.web.adapters.base import Index, adapter_factory
from clld.interfaces import IMapMarker, ILanguage, IValueSet, IValue

# we must make sure custom models are known at database initialization!
from waab import models
from waab.interfaces import IPair
from waab.datatables import Pairs, AffixFunctions


_ = lambda s: s
_('Pair')
_('Pairs')
_('Parameter')
_('Parameters')
_('Source')
_('Sources')


SOURCE_ID_PATTERN = re.compile('\|(?P<id>[a-z0-9]+)\|')
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
            c = ctx.jsondatadict.get('color')
        elif IValueSet.providedBy(ctx):
            c = ctx.language.jsondatadict.get('color')
        elif IValue.providedBy(ctx):
            c = ctx.pair.recipient.jsondatadict.get('color')

        if c:
            return req.static_url('waab:static/%s.png' % c)

        return super(waabMapMarker, self).__call__(ctx, req)


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    config = get_configurator('waab', (waabMapMarker(), IMapMarker), settings=settings)
    config.register_resource('pair', models.Pair, IPair, with_index=True)
    config.register_adapter(adapter_factory('pair/detail_html.mako'), IPair)
    config.register_adapter(adapter_factory('pair/index_html.mako', base=Index), IPair)
    config.register_menu(
        ('dataset', partial(menu_item, 'dataset', label='Home')),
        ('pairs', partial(menu_item, 'pairs')),
        ('parameters', partial(menu_item, 'parameters')),
        #('languages', partial(menu_item, 'languages')),
        ('sources', partial(menu_item, 'sources')),
    )
    config.include('waab.datatables')
    config.include('waab.adapters')
    config.include('waab.maps')
    return config.make_wsgi_app()
