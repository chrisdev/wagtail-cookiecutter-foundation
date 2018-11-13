PROJECT_NAME = {{ cookiecutter.project_slug }}
SHELL := /bin/sh
help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  develop_env              to setup the whole development environment for the project"
	@echo "  virtualenv               to create the virtualenv for the project"
	@echo "  requirements             install the requirements to the virtualenv"
	@echo "  db                       create the PostgreSQL db for the project"
	@echo "  migrate                  run the migrations"
	@echo "  initial_data             populate the site with initial page structure"
	@echo "  copy_media               copy the media(images and documents) to project root"
	@echo "  runserver                Start the django dev server"
	@echo "  superuser                Create superuser with name superuser and password pass"
	@echo "  test                     run unit tests"
	@echo "  func_test                run functional tests"
	@echo "  static_site              generate a static site from the project"
	@echo "  pre_task                 ensures that python deps are installed on host server"
	@echo "  deploy_user              create the deploy user fetch deployment keys."
	@echo "  provision                provision the production server Defaults to production DEPLOY_ENV=staging"
	@echo "  deploy                   provision the staging server Defaults to production DEPLOY_ENV=staging"
	@echo "  livereload               Start Server with livereload functionality"
	@echo "  node_modules             Install Node modules"
	@echo "  compress_images          Minify Images used in site"

.PHONY: requirements


develop_env: virtualenv requirements db initial_data update_modules migrate copy_media node_modules runserver

# Command variables
MANAGE_CMD = python manage.py
PIP_INSTALL_CMD = pip install
PLAYBOOK = ansible-playbook
VIRTUALENV_NAME = venv

# Helper functions to display messagse
ECHO_BLUE = @echo "\033[33;34m $1\033[0m"
ECHO_RED = @echo "\033[33;31m $1\033[0m"

# The default server host local development
HOST ?= localhost:8000
DEPLOY_ENV = production

virtualenv:
	python3 -m venv $(VIRTUALENV_NAME)

requirements:
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		$(PIP_INSTALL_CMD) -r requirements/dev.txt; \
	)

db:
	createdb $(PROJECT_NAME)

migrate:
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		$(MANAGE_CMD) migrate; \
	)

initial_data:
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		psql -d $(PROJECT_NAME) -f ansible/roles/web/files/initial_data.sql; \
	)

copy_media:
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		$(MANAGE_CMD) copy_media; \
	)

update_modules:
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		$ wagtail updatemodulepaths; \
	)
	
runserver:
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		$(MANAGE_CMD) runserver $(HOST); \
	)

superuser:
	echo "from django.contrib.auth.models import User; User.objects.create_superuser('superuser', 'superuser@example.com', 'pass')" | ./manage.py shell

update: update_pip update_node_modules

update_pip:
	$(call ECHO_BLUE,Installing Python requirements)
	@echo '------------------------------'
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		 $(PIP_INSTALL_CMD) -r requirements.txt; \
	)

update_node_modules:
	$(call ECHO_BLUE,Install static dependencies)
	@echo '---------------------------'
	npm install --prefix ./pages/static/

test:
# Run the test cases
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		$(MANAGE_CMD) test; \
	)

func_test:
# Run the test cases
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		$(MANAGE_CMD) test functional_tests; \
	)

static_site:
# Static Site generation
	$(call ECHO_BLUE,Generating Static Site)
	$(MANAGE_CMD) build
	$(MANAGE_CMD) collectstatic
	rsync -av static static_build/

node_modules:
# Install Node modules
	npm install --prefix ./pages/static/

compress_images:
# Minify Images in media
	grunt imagemin

pre_task:
	$(call ECHO_BLUE, Provision the $(DEPLOY_ENV) server )
	(\
		cd ansible; \
		$(PLAYBOOK) -i $(DEPLOY_ENV) pre_task.yml; \
	)

deploy_user:
	$(call ECHO_BLUE, Create the deploy user for based $(DEPLOY_ENV) )
	(\
		cd ansible; \
		$(PLAYBOOK) -i $(DEPLOY_ENV) provision.yml --tags user; \
	)

provision:
	$(call ECHO_BLUE, Provision the $(DEPLOY_ENV) server )
	(\
		cd ansible; \
		$(PLAYBOOK) -i $(DEPLOY_ENV) provision.yml --skip-tags user; \
	)

deploy:
	$(call ECHO_BLUE, deploy changes to the $(DEPLOY_ENV) server )
	(\
		cd ansible; \
		$(PLAYBOOK) -i $(DEPLOY_ENV) deploy.yml;  \
	)

livereload:
	$(call ECHO_BLUE,Starting server with livereload)
	@echo '---------------------------'
	$(MANAGE_CMD) livereload

clean:
# Remove all *.pyc, .DS_Store and temp files from the project
	$(call ECHO_BLUE,removing .pyc files...)
	@find . -name '*.pyc' -exec rm -f {} \;
	$(call ECHO_BLUE,removing static files...)
	@rm -rf $(PROJECT_NAME)/_static/
	$(call ECHO_BLUE,removing temp files...)
	@rm -rf $(PROJECT_NAME)/_tmp/
	$(call ECHO_BLUE,removing .DS_Store files...)
	@find . -name '.DS_Store' -exec rm {} \;

shell:
# Run a local shell for debugging
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		$(MANAGE_CMD) shell; \
	)
