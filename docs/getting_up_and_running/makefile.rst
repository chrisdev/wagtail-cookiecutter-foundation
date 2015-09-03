Using Makefile
==============

The projects created with this cookiecutter contains Makefile which helps to setup project easily.

Please use 'make <target>' where <target> is one of

all
---
This will create virtual environment, install pip requirements, create database, migrate, load initial data to database, install bower packages, run server for you. Awesome, right?

virtualenv
----------
To create the virtualenv for the project.

requirements
------------
Install the requirements to the virtualenv

db
--
Create the PostgreSQL db for the project.

migrate
-------
Run the migrations.

initial_data
------------
Populate the site with initial page structure.

bower
-----
Install front-end dependencies with bower.

runserver
---------
Start the django dev server.

test
----
Run unit tests.

func_test
---------
Run functional tests.

static_site
-----------
Generate a static site from the project.

deploy_user
-----------
Create the deploy user fetch deployment keys. Defaults to production DEPLOY_ENV=vagrant/staging.

provision
---------
Provision the production server Defaults to production DEPLOY_ENV=staging.

deploy
------
Provision the staging server Defaults to production DEPLOY_ENV=staging.

livereload
----------
Start Server with livereload functionality.