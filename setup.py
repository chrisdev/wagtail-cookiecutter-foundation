#!/usr/bin/env python

import os
import sys

try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

# Our version ALWAYS matches the version of Wagtail we support
# If Wagtail has a new release, we branch, tag, then update this setting after the tag.
version = '1.6.1'

if sys.argv[-1] == 'tag':
    os.system('git tag -a %s -m "version %s"' % (version, version))
    os.system('git push --tags')
    sys.exit()

with open('README.rst') as readme_file:
    long_description = readme_file.read()

setup(
    name='wagtail-cookiecutter-foundation',
    version=version,
    description='Cookiecutter template for Wagtail CMS using Zurb Foundation 6 ',
    long_description=long_description,
    author="Christopher Clarke",
    author_email='cclarke@chrisdev.com',
    url='https://github.com/chrisdev/wagtail-cookiecutter-foundation',
    packages=[],
    license='MIT license',
    zip_safe=False,
    classifiers=[
        'Development Status :: 3 - Beta',
        'Environment :: Console',
        'Framework :: Django :: 1.10',
        'Intended Audience :: Developers',
        'Natural Language :: English',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
        'Topic :: Software Development',
    ],
    keywords=(
        'cookiecutter, Python, wagtail, foundation, projects, project templates, '
        'django, skeleton, scaffolding, project directory, setup.py'
    ),
)
