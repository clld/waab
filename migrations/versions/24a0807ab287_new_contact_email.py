"""new contact email

Revision ID: 24a0807ab287
Revises: 95ca22c431fc
Create Date: 2019-01-30 08:49:26.631169

"""

# revision identifiers, used by Alembic.
revision = '24a0807ab287'
down_revision = '95ca22c431fc'
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.execute("update dataset set contact = 'frank.seifart@berlin.de'")


def downgrade():
    pass
