from setuptools import setup, find_packages

requires = [
    'clldmpg>=1.0.0',
]

tests_require = [
    'WebTest',
    'mock==1.0',
]

setup(
    name='waab',
    version='0.0',
    description='waab',
    long_description='',
    classifiers=[
        "Programming Language :: Python",
        "Programming Language :: Python :: 2.7",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.4",
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
    tests_require=tests_require,
    test_suite="waab",
    entry_points="""\
    [paste.app_factory]
    main = waab:main
    """)
