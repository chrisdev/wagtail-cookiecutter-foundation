Wagtail cookiecutter Foundation
================================
A cookiecutter_ template for `Wagtail CMS`_ featuring `Zurb Foundation`_ front-end
framework.

.. figure:: http://i.imgur.com/0V9TeGC.gif
   :alt: Wagtail Cookiecutter Foundation

.. _cookiecutter: https://github.com/audreyr/cookiecutter
.. _`Wagtail CMS`: https://wagtail.io
.. _`Zurb Foundation`: https://foundation.zurb.com

What's included
---------------
- A Django project with Wagtail_ pre-installed with support for all the
  `Zurb Foundation`_ HTML and CSS UI components (typography, forms, buttons,
  navigation and other interface components)

- A comprehensive suite of apps to use for building your site.
  We take an approach similar to the `Wagtail Demo Project`_ but we use a
  modular approach so that can pick and choose the functionality you want to include
  on you site. We provide individual modules for:

    - ``pages`` - Hompage, Standard Pages, People Page, Contact Page, etc.
    - ``blog`` - Blogging or site news
    - ``events`` - Event management
    - ``photo_gallery``- To facilitate easy  management of photo galleries
    - ``utils`` - utility functions, templatetags and filters

.. _Wagtail: https://wagtail.io
.. _`Wagtail Demo Project`: https://github.com/torchbox/wagtaildemo


- Templates and template tags to support Foundation ``HTML`` and ``CSS UI``
  components including:

    - Top bar including (sticky nav)
    - Off canvas
    - Bread crumbs
    - SubNav
    - Pagination

- Full libsass_ Foundation Sass support through `django-compressor`_/`django-libsass`_

- We also provide support for updating your Foundation framework through
  Bower_ and provide support for an alternative front-end work flow based on
  using Bower_ and a task runner like Grunt_ or Gulp_

- Support for Vagrant_ which uses the `torchbox/wagtail base box`_

- Deployment and provisioning using Ansible_ that has been extensively tested on
  Digital Ocean and Linode VPS but should be easy to modified for hosting on
  EC2 etc..

.. _`torchbox/wagtail base box`: https://github.com/torchbox/vagrant-wagtail-base
.. _Ansible: https://http://www.ansible.com/home
.. _libsass: https://github.com/sass/libsass
.. _django-compressor: https://github.com/sass/libsass
.. _django-libsass: https://github.com/torchbox/django-libsass
.. _Bower: http://bower.io
.. _Gulp: https://gulpjs.com
.. _Grunt: https://gruntjs.com
.. _Vagrant: https://www.vagrantup.com/

Usage
-----

To create a new `Wagtail CMS`_ project. First, install cookiecutter ::

    $ pip install cookiecutter

Now run it against this repo::

    $ cookiecutter https://github.com/chrisdev/wagtail-cookiecutter-foundation.git

You'll be prompted for some questions, answer them, then it will create a Django project for you.


You will be prompted to answer the following questions. ::

    Cloning into 'wagtail-cookiecutter-foundation'...
    remote: Counting objects: 611, done.
    remote: Compressing objects: 100% (13/13), done.
    remote: Total 611 (delta 3), reused 0 (delta 0), pack-reused 598
    Receiving objects: 100% (611/611), 423.98 KiB | 0 bytes/s, done.
    Resolving deltas: 100% (264/264), done.
    Checking connectivity... done.
    project_name (default is "Wagtail Project")?
    repo_name (default is "wagtailproject")?
    author_name (default is "Your Name")?
    email (default is "Your email")?
    description (default is "A short description of the project.")?
    timezone (default is "UTC")?
    now (default is "2015/04/16")?
    year (default is "2015")?


Enter the project and take a look around::

    $ cd wagtaiproject/
    $ ls

Create a GitHub, Bitbucket repo and push it there::

    $ git init
    $ git add .
    $ git commit -m "first awesome commit"
    $ git remote add origin git@github.com:cclarke/my_site.git
    $ git push -u origin master

Now take a look at your repo. Don't forget to carefully look at the generated README. Awesome, right?

Getting up and running
========================
To The following steps assume the following dependencies

    * pip
    * virtualenv/pyvenv/virtualenvwrapper
    * PostgreSQL

Firstly, open up a command line shell in your new projects directory.


1. **Create a virtual environment**


  **Linux/Mac OSX:** :code:`pyvenv venv`

  **Windows:** :code:`c:\Python34\python -m venv myenv`

  **Python 2.7**

  ``pyvenv`` is only included with Python 3.3 onwards.
  To get virtual environments on Python 2, use the ``virtualenv`` package:

  .. code-block:: bash

      pip install virtualenv
      virtualenv venv

  **Virtualenvwrapper**

  virtualenvwrapper_ provides a set of commands which makes working with virtual environments much more pleasant. It also places all your virtual environments in one place.

  To install (make sure virtualenv is already installed):

  .. code-block:: bash

      pip install virtualenvwrapper
      export WORKON_HOME=~/Envs
      source /usr/local/bin/virtualenvwrapper.sh
      mkvirtualenv venv

  *Windows*:

  .. code-block:: bash

      pip install virtualenvwrapper-win
      mkvirtualenv venv

  .. _virtualenvwrapper: http://virtualenvwrapper.readthedocs.org/en/latest/index.html

2. **Activate the virtual environment**

  **Linux/Mac OSX:** :code:`source venv/bin/activate`

  **Windows:** :code:`venv/Scripts/activate.bat`

  **Virtualenvwrapper:** :code:`workon venv`

3. **Install PIP requirements**

  :code:`pip install -r requirements/dev.txt`

4. **Create the database**

  By default require ``PostgreSQL`` to be installed

  :code: `createdb my_site`

  :code:`./manage.py migrate`

5. **Load the Initial Data**

  :code:`./manage.py load_initial_data`
  
  The default Admin username is *admin*
  
  The default Admin password is *admin123*

6. **Install Packages (Foundation, Font-Awesome etc.) using Bower package manager**

  :code:`bower install`

  For more details on bower visit: http://bower.io
  
7. **Run the development server**

  :code:`./manage.py runserver`

  Your site is now accessible at ``http://localhost:8000``,
  with the admin backend available at ``http://localhost:8000/admin/``.


Using Vagrant
-------------
Alternatively you may prefer to use Vagrant_ to run your project locally in
is own virtual machine. This will you to use PostgreSQL, Elasticsearch
Redis etc.  in development without having to install them on your host machine.
To install Vagrant, see: `Installing Vagrant`_

.. _`Installing Vagrant`: https://docs.vagrantup.com/v2/installation/


To setup the Vagrant box, run the following commands

 .. code-block:: bash

    vagrant up # This may take some time on first run
    vagrant ssh
    # within the ssh session
    dj createsuperuser
    djrun


If you now visit http://localhost:8000 you should see the default wagtail
foundation site

You can browse the Wagtail admin interface at: http://localhost:8000/admin

You can read more about how Vagrant works at: https://docs.vagrantup.com/v2/
