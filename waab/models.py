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
from clld.db.models.common import Language, ValueSet, IdNameDescriptionMixin, Parameter

from waab.interfaces import IPair


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


#-----------------------------------------------------------------------------
# specialized common mapper classes
#-----------------------------------------------------------------------------
@implementer(interfaces.IValueSet)
class waabValueSet(ValueSet, CustomModelMixin):
    pk = Column(Integer, ForeignKey('valueset.pk'), primary_key=True)
    pair_pk = Column(Integer, ForeignKey('pair.pk'))
    pair = relationship(Pair, backref='valuesets')


@implementer(interfaces.IParameter)
class AffixFunction(Parameter, CustomModelMixin):
    pk = Column(Integer, ForeignKey('parameter.pk'), primary_key=True)
    representation = Column(Integer)
