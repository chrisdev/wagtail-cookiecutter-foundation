
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