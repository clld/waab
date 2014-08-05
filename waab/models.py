from __future__ import unicode_literals

from zope.interface import implementer
from sqlalchemy import (
    Column,
    Unicode,
    Integer,
    ForeignKey,
    UniqueConstraint,
)
from sqlalchemy.orm import relationship

from clld import interfaces
from clld.db.meta import Base, CustomModelMixin
from clld.db.models.common import (
    Language, Value, IdNameDescriptionMixin, Parameter, Source,
)

from waab.interfaces import IPair


class PairSource(Base):
    __table_args__ = (UniqueConstraint('pair_pk', 'source_pk'),)
    pair_pk = Column(Integer, ForeignKey('pair.pk'))
    source_pk = Column(Integer, ForeignKey('source.pk'))


@implementer(IPair)
class Pair(Base, IdNameDescriptionMixin):
    recipient_pk = Column(Integer, ForeignKey('language.pk'))
    donor_pk = Column(Integer, ForeignKey('language.pk'))
    area = Column(Unicode)
    reliability = Column(Unicode)
    int_reliability = Column(Integer)
    count_interrel = Column(Integer)
    count_borrowed = Column(Integer)

    recipient = relationship(
        Language, primaryjoin=recipient_pk == Language.pk, backref='donor_assocs')
    donor = relationship(
        Language, primaryjoin=donor_pk == Language.pk, backref='recipient_assocs')
    sources = relationship(Source, secondary=PairSource.__table__, backref='pairs')


# ----------------------------------------------------------------------------
# specialized common mapper classes
# ----------------------------------------------------------------------------
@implementer(interfaces.IValue)
class waabValue(Value, CustomModelMixin):
    pk = Column(Integer, ForeignKey('value.pk'), primary_key=True)
    pair_pk = Column(Integer, ForeignKey('pair.pk'))
    pair = relationship(Pair, backref='values')
    numeric = Column(Integer)

    def format(self):
        return '%s from %s' % (self.numeric, self.pair.donor)


@implementer(interfaces.IParameter)
class AffixFunction(Parameter, CustomModelMixin):
    pk = Column(Integer, ForeignKey('parameter.pk'), primary_key=True)
    representation = Column(Integer)
    count_borrowed = Column(Integer)
