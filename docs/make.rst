The easiest way to get started is to use the built in ``make`` commands. Your project contains a Makefile that allows you to setup your development environment with a single command. This command will create your project's virtual environment, install all pip dependencies,  create the development database, run migrations and load initial data to database, install front-end dependencies and finally start the development server for you. 

To do this run ::

	make all

You can access your site at ``http://localhost:8000``. The Admin back-end is available at ``http://localhost:8000/admin/``.The default Admin username is *admin* and The default Admin password is *admin123*.

The make command available for development are discussed in more detail below.

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