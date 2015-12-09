"""new contact email

Revision ID: 384da3b88896
Revises: 55912b4a9d56
Create Date: 2015-12-09 11:35:03.872107

"""

# revision identifiers, used by Alembic.
revision = '384da3b88896'
down_revision = '55912b4a9d56'
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.execute("update dataset set contact = 'f.c.seifart@uva.nl'")


def downgrade():
    pass
