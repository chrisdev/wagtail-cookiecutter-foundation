Grunt Tasks
===========

Make sure that nodejs_ is installed. Then in the project root run ::
	
	$ npm install
	or
	$ make node_modules

.. _nodejs: http://nodejs.org/download/

Image Compression
-----------------

To compress images used in project’s made with this cookiecutter run ::

	$ grunt imagemin

You can also use make to run the above task ::

	$ make compress_images