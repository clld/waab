from clld.web.datatables.base import (
    Col, LinkCol, DataTable,
)


class Pairs(DataTable):
    def col_defs(self):
        return [
            LinkCol(self, 'pair')
            #LinkCol(self, 'recipient'),
            #LinkCol(self, 'donor'),
        ]
