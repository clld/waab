from zope.interface import implementer
from sqlalchemy import (
    Column,
    String,
    Unicode,
    Integer,
    Boolean,
    ForeignKey,
    UniqueConstraint,
)
from sqlalchemy.orm import relationship, backref
from sqlalchemy.ext.declarative import declared_attr
from sqlalchemy.ext.hybrid import hybrid_property

from clld import interfaces
from clld.db.meta import Base, CustomModelMixin
from clld.db.models.common import Language, Value, IdNameDescriptionMixin, Parameter, Source

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
    interrelatedness = Column(Integer)
    count_affixes = Column(Integer)

    recipient = relationship(Language, primaryjoin=recipient_pk==Language.pk, backref='donor_assocs')
    donor = relationship(Language, primaryjoin=donor_pk==Language.pk, backref='recipient_assocs')
    sources = relationship(Source, secondary=PairSource.__table__, backref='pairs')


#-----------------------------------------------------------------------------
# specialized common mapper classes
#-----------------------------------------------------------------------------
@implementer(interfaces.IValue)
class waabValue(Value, CustomModelMixin):
    pk = Column(Integer, ForeignKey('value.pk'), primary_key=True)
    pair_pk = Column(Integer, ForeignKey('pair.pk'))
    pair = relationship(Pair, backref='values')

    def __unicode__(self):
        return '%s < %s' % (self.name, self.pair.donor)


@implementer(interfaces.IParameter)
class AffixFunction(Parameter, CustomModelMixin):
    pk = Column(Integer, ForeignKey('parameter.pk'), primary_key=True)
    representation = Column(Integer)

    superparam_pk = Column(Integer, ForeignKey('affixfunction.pk'))
    subparams = relationship(
        'AffixFunction',
        foreign_keys=[superparam_pk],
        backref=backref('superparam', remote_side=[pk]))
    count_subparams = Column(Integer)
