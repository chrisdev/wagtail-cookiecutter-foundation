PROJECT_NAME = {{ cookiecutter.repo_name }}
SHELL := /bin/sh
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  all               		  to setup the whole development environment for the project"
	@echo "  virtualenv               to create the virtualenv for the project"
	@echo "  requirements             install the requirements to the virtualenv"
	@echo "  db                       create the PostgreSQL db for the project"
	@echo "  migrate                  run the migrations"
	@echo "  initial_data             populate the site with initial page structure"
	@echo "  bower                    Install front-end dependencies with bower"
	@echo "  runserver                Start the django dev server"
	@echo "  test                     run unit tests"
	@echo "  func_test                run functional tests"
	@echo "  static_site              generate a static site from the project"
	@echo "  deploy_user              create the deploy user fetch deployment keys. Defaults to production DEPLOY_ENV=vagrant/staging"
	@echo "  provision                provision the production server Defaults to production DEPLOY_ENV=staging"
	@echo "  deploy                   provision the staging server Defaults to production DEPLOY_ENV=staging"
	@echo "  livereload               Start Server with livereload functionality"

.PHONY: requirements


all: virtualenv requirements db migrate initial_data bower runserver

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
DEPLOYMENT_ENV = production

virtualenv: 
	virtualenv $(VIRTUALENV_NAME)

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
		$(MANAGE_CMD) load_initial_data; \
	)

bower:
	bower install

runserver:
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		$(MANAGE_CMD) runserver $(HOST); \
	)

update: update_pip update_bower

update_pip:
	$(call ECHO_BLUE,Installing Python requirements)
	@echo '------------------------------'
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		 $(PIP_INSTALL_CMD) -r requirements.txt; \
	)

update_bower:
	$(call ECHO_BLUE,Install static dependencies)
	@echo '---------------------------'
	bower update

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
	$(PIP_INSTALL_CMD) django-medusa django-sendfile
	$(MANAGE_CMD) staticsitegen
	$(MANAGE_CMD) collectstatic
	rsync -av static static_build/
	rsync -av media static_build/

deploy_user:
ifeq ($(DEPLOY_ENV), vagrant)
	$(call ECHO_BLUE, Create the deploy user for vagrant based staging VM)
	(\
		cd ansible; \
		$(PLAYBOOK) -c paramiko -i staging vagrant_staging_setup.yml --ask-pass --sudo -u vagrant; \
	)
else
	$(call ECHO_BLUE, Create the deploy user for based $(DEPLOY_ENV) )
	(\
		cd ansible; \
		$(PLAYBOOK) -i $(DEPLOY_ENV) provision.yml --tags user; \
	)
endif

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
