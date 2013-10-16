from functools import partial

from clld.web.app import get_configurator, menu_item
from clld.web.adapters.base import Index, adapter_factory

# we must make sure custom models are known at database initialization!
from waab import models
from waab.interfaces import IPair
from waab.datatables import Pairs


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    config = get_configurator('waab', settings=settings)
    config.register_resource('pair', models.Pair, IPair, with_index=True)
    config.register_adapter(adapter_factory('pair/detail_html.mako'), IPair)
    config.register_adapter(adapter_factory('pair/index_html.mako', base=Index), IPair)
    config.register_datatable('pairs', Pairs)
    config.register_menu(
        ('dataset', partial(menu_item, 'dataset', label='Home')),
        ('parameters', partial(menu_item, 'parameters')),
        ('pairs', partial(menu_item, 'pairs')),
        ('languages', partial(menu_item, 'languages')),
        ('sources', partial(menu_item, 'sources')),
    )
    return config.make_wsgi_app()
