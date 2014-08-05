from path import path

from clld.tests.util import TestWithApp

import waab


class Tests(TestWithApp):
    __cfg__ = path(waab.__file__).dirname().joinpath('..', 'development.ini').abspath()
    __setup_db__ = False

    def test_home(self):
        self.app.get_html('/')

    def test_pairs(self):
        self.app.get_html('/pairs')
        self.app.get_dt('/pairs?sSearch_0=Al&iSortingCols=1&iSortCol_0=0')
        self.app.get_dt('/pairs?sSearch_1=Bo&iSortingCols=1&iSortCol_0=1')
        self.app.get_dt('/pairs?iSortingCols=1&iSortCol_0=5')
        self.app.get_html('/pairs/133')

    def test_values(self):
        self.app.get_dt('/values?iSortingCols=1&iSortCol_0=1')
        self.app.get_dt('/values?parameter=1&sSearch_1=2')
        self.app.get_dt('/values?pair=135&iSortingCols=1&iSortCol_0=1')

    def test_parameters(self):
        self.app.get_html('/parameters')
        self.app.get_html('/parameters/1')
        self.app.get_json('/parameters/1.geojson')

    def test_languages(self):
        self.app.get_html('/languages')
        self.app.get_json('/languages.geojson')

    def test_sources(self):
        self.app.get_html('/sources')
        self.app.get_dt('/sources?sEcho=1')
