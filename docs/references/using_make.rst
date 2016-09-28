Make Commands
=============

The easiest way to get started is to use the built in ``make`` commands. Your project contains a Makefile that allows you to setup your development environment with a single command. This command will create your project's virtual environment, install all pip dependencies,  create the development database, run migrations and load initial data to database, install front-end dependencies and finally start the development server for you. 

To do this run ::

	make develop_env

You can access your site at ``http://localhost:8000``. The Admin back-end is available at ``http://localhost:8000/admin/``.The default Admin username is *admin* and The default Admin password is *admin123*.

Make command line
-------------------

Create the virtualenv for the project ::

	make virtualenv

Install the requirements to the virtualenv ::

	make requirements 

Create a PostgreSQL database for the project. It will have the same name as the project ::

	make db 

Run the migrations ::

	make migrate 

Populate the site with initial page structure ::

	make initial_data 

Copy the media(images and documents) to project root ::

	make copy_media 

Install all front-end dependencies with bower ::

	make bower 

Start the standard Django dev server ::

	make runserver

Start Server with livereload functionality ::

    make livereload

Run your unit tests ::  

    make test

Run your functional tests ::

    make func_test

Install Node modules::

    make node_modules

Minify Images used in site ::

    make compress_images

Generate a static site from the project ::

	make static_site


===========
For Staging
===========
	
For staging run / a Vagrant based staging server ::

    make deploy_user DEPLOY_ENV=staging

This will create the deploy user for the production server. For staging run ::

    make deploy_user DEPLOY_ENV=staging

If you want to use the Vagrant based staging server first ensure that the 
Vagrant VM is running ::

    cd /my_project/ansible
    vagrant up

Then create the deployment user return to the project root and run:: 

    make deploy_user DEPLOY_ENV=vagrant

When prompted for the password, enter "vagrant".

If you get the following error ::

    fatal: [staging.example.org] => {'msg': 'FAILED: Authentication failed.', 'failed': True}``
       
For the staging server run ::

    make provision DEPLOY_ENV=staging

To provision the Vagrant based staging server run ::

    make provision DEPLOY_ENV=vagrant