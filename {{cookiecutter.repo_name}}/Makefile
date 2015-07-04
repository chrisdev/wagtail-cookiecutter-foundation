PROJECT_NAME = {{ cookiecutter.repo_name }}
SHELL := /bin/sh

.PHONY: requirements

all: virtualenv requirements db migrate initial_data bower runserver

# Command variables
MANAGE_CMD = python manage.py
PIP_INSTALL_CMD = pip install

VIRTUALENV_NAME = venv

# Helper functions to display messagse
ECHO_BLUE = @echo "\033[33;34m $1\033[0m"
ECHO_RED = @echo "\033[33;31m $1\033[0m"

# The default server host local development
HOST ?= localhost:8000


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
	bower install

test:
# Run the test cases
	( \
		. $(VIRTUALENV_NAME)/bin/activate; \
		$(MANAGE_CMD) test; \
	)

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
