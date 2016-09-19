Getting Started
===============

Here is how we create a new Django project quickly while letting cookiecutter_ to do all the work.

To get started we assume the following dependencies ::
    
    pip
    virtualenv/pyvenv/virtualenvwrapper
    PostgreSQL
    Bower
    
.. raw:: html

    <div>
       <iframe width="640" height="360" src="https://www.youtube.com/embed/jNu11gMleuY?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
    </div>

Get Cookiecutter ::

    $ pip install cookiecutter

Now run it against this repo::

    $ cookiecutter https://github.com/chrisdev/wagtail-cookiecutter-foundation.git
    
You'll be prompted to provide some values for your project.

Enter the project ::

    $ cd wagtail_project/

Create a git repo and push it there::

    $ git init
    $ git add .
    $ git commit -m "first awesome commit"
    $ git remote add origin git@github.com:cclarke/my_site.git
    $ git push -u origin master
    
To create your project's virtual environment, install all pip dependencies, create the development database, run migrations and load initial data to database, install front-end dependencies and finally start the development server for you run ::

	make develop_env

You can access your site at ``http://localhost:8000``. The Admin back-end is available at ``http://localhost:8000/admin/``.The default Admin username is *admin* and The default Admin password is *admin123*.

.. _cookiecutter: https://github.com/audreyr/cookiecutter