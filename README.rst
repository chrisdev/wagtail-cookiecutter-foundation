Wagtail Cookiecutter Foundation
================================

.. image:: https://pyup.io/repos/github/chrisdev/wagtail-cookiecutter-foundation/shield.svg
     :target: https://pyup.io/repos/github/chrisdev/wagtail-cookiecutter-foundation/
     :alt: Updates
.. image:: https://travis-ci.org/chrisdev/wagtail-cookiecutter-foundation.svg?branch=master
   :target: https://travis-ci.org/chrisdev/wagtail-cookiecutter-foundation
   
A cookiecutter_ template for `Wagtail CMS`_ was built using `Zurb Foundation`_ 
front-end framework. A demo of a default project generated from this cookiecutter is available at http://wagtail.chrisdev.com.

.. figure:: http://i.imgur.com/FGJtr78.gif :alt: Wagtail Cookiecutter Foundation


Read the Docs: http://wagtail-cookiecutter-foundation.readthedocs.org/en/latest/

Features
----------

A Django project with Wagtail_ pre-installed with support for all the `Zurb Foundation`_ components.

* For Django 1.9
* Renders Django projects with 100% starting test coverage
* ZURB Foundation
* Optimized development and production settings
* Comes with custom user model ready to go.
* Grunt build for compass and livereload
* Ansible support for development and production
* Works with Python 2.7.x or 3.5.x

.. _cookiecutter: https://github.com/audreyr/cookiecutter
.. _`Wagtail CMS`: https://wagtail.io
.. _`Zurb Foundation`: https://foundation.zurb.com
.. _`Read the Docs`: http://wagtail-cookiecutter-foundation.readthedocs.org/en/latest/

Prerequisites
---------------
You need to have the following already installed:
   
    * Python 2.7/3.5
    * pip
    * virtualenv/pyvenv/virtualenvwrapper
    * PostgreSQL
    * VirtualBox or VMWare/Vagrant (required for vagrant staging)
    * Ansible
    * node, npm and git and bower

Usage
------
Let's pretend you want to create a Django project called "wagtail_project". Rather than using `startproject` and then editing the results to include your name, email, and various configuration issues that always get forgotten until the worst possible moment, get cookiecutter_ to do all the work.

First, get Cookiecutter. Trust me, it's awesome::

    $ pip install cookiecutter

Now run it against this repo::

    $ cookiecutter https://github.com/chrisdev/wagtail-cookiecutter-foundation.git

You'll be prompted for some values. Provide them, then a Django project will be created for you ::

    Cloning into 'wagtail-cookiecutter-foundation'...
    remote: Counting objects: 611, done.
    remote: Compressing objects: 100% (13/13), done.
    remote: Total 611 (delta 3), reused 0 (delta 0), pack-reused 598
    Receiving objects: 100% (611/611), 423.98 KiB | 0 bytes/s, done.
    Resolving deltas: 100% (264/264), done.
    Checking connectivity... done.
    project_name (default is "Wagtail Project")?
    repo_name (default is "wagtail_project")?
    version_control_system (default is "hg")?,
    vcs_host (default is "bitbucket")?,
    author_name (default is "Your Name")?
    email (default is "Your email")?
    description (default is "A short description of the project.")?
    timezone (default is "UTC")?
    now (default is "2015/04/16")?
    year (default is "2015")?
    production_host_name (default is  example.org)?
    use_ssl_in_production (default is true)?
    staging_host_name (default is staging.example.org)?
    use_vagrant_staging (default is true)?
    deploy_user_name (default is django)
    django_admin_user (default is my_admin_user)

Enter the project and take a look around::

    $ cd wagtail_project/
    $ ls

Create a git repo and push it there::

    $ git init
    $ git add .
    $ git commit -m "first awesome commit"
    $ git remote add origin git@github.com:cclarke/my_site.git
    $ git push -u origin master

Using make
^^^^^^^^^^^^

The easiest way to get started is to use the built in ``make`` commands. Your project contains a Makefile that allows you to setup your development environment with a single command. This command will create your project's virtual environment, install all pip dependencies,  create the development database, run migrations and load initial data to database, install front-end dependencies and finally start the development server for you. 

To do this run ::

	make all

You can access your site at ``http://localhost:8000``. The Admin back-end is available at ``http://localhost:8000/admin/``.The default Admin username is *admin* and The default Admin password is *admin123*.

App Modules
------------
We provide a comprehensive suite of apps to use for building your site. We take  a modular approach so that can pick and choose the functionality you want to include. We provide separate modules for:

    - ``pages`` - Different pages including Homepage, Standard & Faqs Page etc.
    - ``blog`` - Blog or site news
    - ``contact`` - Contact Page with included contact us form
    - ``documents_gallery`` - Organize documents in folders using wagtail tags
    - ``events`` - Events
    - ``people`` - For the people in your organization or team.
    - ``photo_gallery`` - Create photo galleries using wagtail tags
    - ``products`` - Ideal for a product or portfolio showcase
    - ``faq`` - FAQ and answers.
    - ``utils`` - Various utility functions, templatetags and filters
    
Other Components
^^^^^^^^^^^^^^^^^^
- We provide templates and templatetags to support all the major Foundation ``HTML`` 
  and ``CSS`` UI components including:

    - Top bar including (sticky nav)
    - Off canvas menu
    - Bread crumbs
    - SubNav
    - Pagination
    - Reveals  

- We also provide comprehensive set of  `make` commands to  help you to  perform key development, provisioning and deployment tasks.

- libsass_ Foundation Sass support through `django-compressor`_/`django-libsass`_
  
- Server provisioning and deployment using Ansible_ that has been extensively tested on Digital Ocean and Linode VPSs but it should work on other platforms. You can drive the Ansible playbooks using a set of make commands.

.. _`torchbox/wagtail base box`: https://github.com/torchbox/vagrant-wagtail-base
.. _Ansible: http://www.ansible.com/home
.. _libsass: https://github.com/sass/libsass
.. _django-compressor: https://github.com/sass/libsass
.. _django-libsass: https://github.com/torchbox/django-libsass
.. _Bower: http://bower.io
.. _Gulp: https://gulpjs.com
.. _Grunt: https://gruntjs.com

Provisioning and Deployment
-----------------------------

You project comes with a suite of Ansible_ playbooks to support the provisioning your servers and deploying changes to production and staging.  We also support the creation of a Vagrant_ based staging server so you can "stage" your site locally and tweak and experiment with different deployment configurations.  To keep things simple we assume that all your application components i.e.  ``Django``, ``PostgreSQL``, ``redis`` and so on are all deployed on a single server.  

.. _Vagrant: https://docs.vagrantup.com/v2/

Other Tasks
------------

Static Sites
^^^^^^^^^^^^^

You can use `make` to generate a static site from the project. The static site will be in a folder `static_build`.  The command will ensure that all static assets and media required for the site to perform correctly are copied to the build folder ::

    make static_site

Image Compression
^^^^^^^^^^^^^^^^^^
To compress images used in project's made with this cookiecutter run: ::

	grunt imagemin

You can also use make to run the above task ::

	make compress_images


Contributing
--------------

Contributions are always welcome to improve this project. If you think you've found a bug or are interested in contributing fork this project and send the pull request. After review, your pull request will be merged. We are always happy to receive pull requests. If you identify any issue, please raise it in the issues section.

.. end-here