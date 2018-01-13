import pytest

pytest_plugins = ['clld']


@pytest.mark.parametrize(
    "method,path",
    [
        ('get_html', '/'),
        ('get_html', '/pairs'),
        ('get_dt', '/pairs?sSearch_0=Al&iSortingCols=1&iSortCol_0=0'),
        ('get_dt', '/pairs?sSearch_1=Bo&iSortingCols=1&iSortCol_0=1'),
        ('get_dt', '/pairs?iSortingCols=1&iSortCol_0=5'),
        ('get_html', '/pairs/133'),
        ('get_dt', '/values?iSortingCols=1&iSortCol_0=1'),
        ('get_dt', '/values?parameter=1&sSearch_1=2'),
        ('get_dt', '/values?pair=135&iSortingCols=1&iSortCol_0=1'),
        ('get_html', '/parameters'),
        ('get_html', '/parameters/1'),
        ('get_json', '/parameters/1.geojson'),
        ('get_html', '/languages'),
        ('get_json', '/languages.geojson'),
        ('get_html', '/sources'),
        ('get_dt', '/sources?sEcho=1'),
    ])
def test_pages(app, method, path):
    getattr(app, method)(path)
