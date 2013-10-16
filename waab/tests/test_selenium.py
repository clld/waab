from clld.tests.util import TestWithSelenium

import waab


class Tests(TestWithSelenium):
    app = waab.main({}, **{'sqlalchemy.url': 'postgres://robert@/waab'})
