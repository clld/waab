from path import path

from clld.tests.util import TestWithApp

import waab


class Tests(TestWithApp):
    __cfg__ = path(waab.__file__).dirname().joinpath('..', 'development.ini').abspath()
    __setup_db__ = False

    def test_home(self):
        self.app.get('/', status=200)

    def test_pairs(self):
        self.app.get('/pairs', status=200)
        self.app.get('/pairs?sEcho=1&sSearch_0=Al&iSortingCols=1&iSortCol_0=0', xhr=True, status=200)
        self.app.get('/pairs?sEcho=1&sSearch_1=Bo&iSortingCols=1&iSortCol_0=1', xhr=True, status=200)
        self.app.get('/pairs/133', status=200)

    def test_values(self):
        self.app.get('/values?sEcho=1&iSortingCols=1&iSortCol_0=1', xhr=True, status=200)
        self.app.get('/values?sEcho=1&parameter=1&sSearch_1=2', xhr=True, status=200)
        self.app.get('/values?sEcho=1&pair=135&iSortingCols=1&iSortCol_0=1', xhr=True, status=200)

    def test_parameters(self):
        self.app.get('/parameters', status=200)
        self.app.get('/parameters/1', status=200)
        self.app.get('/parameters/1.geojson', status=200)

    def test_languages(self):
        self.app.get('/languages', status=200)
        self.app.get('/languages.geojson', status=200)

    def test_sources(self):
        self.app.get('/sources', status=200)
        self.app.get('/sources?sEcho=1', xhr=True, status=200)
