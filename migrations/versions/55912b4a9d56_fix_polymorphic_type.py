"""fix polymorphic_type

Revision ID: 55912b4a9d56
Revises: 
Create Date: 2014-11-26 15:55:22.559000

"""

# revision identifiers, used by Alembic.
revision = '55912b4a9d56'
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    update_pmtype(['value', 'parameter'], 'base', 'custom')


def downgrade():
    update_pmtype(['value', 'parameter'], 'custom', 'base')


def update_pmtype(tablenames, before, after):
    for table in tablenames:
        op.execute(sa.text('UPDATE %s SET polymorphic_type = :after '
            'WHERE polymorphic_type = :before' % table
            ).bindparams(before=before, after=after))
