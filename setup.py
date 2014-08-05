import os

from setuptools import setup, find_packages


requires = [
    'clld>=0.16',
    'clldmpg>=0.3',
    'pyramid>=1.5.1',
    'SQLAlchemy>=0.8.7',
    'transaction',
    'pyramid_tm',
    'zope.sqlalchemy',
    'waitress',
]

setup(name='waab',
      version='0.0',
      description='waab',
      long_description='',
      classifiers=[
        "Programming Language :: Python",
        "Framework :: Pyramid",
        "Topic :: Internet :: WWW/HTTP",
        "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
        ],
      author='',
      author_email='',
      url='',
      keywords='web pyramid pylons',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      install_requires=requires,
      tests_require=requires,
      test_suite="waab",
      entry_points="""\
      [paste.app_factory]
      main = waab:main
      """,
)
