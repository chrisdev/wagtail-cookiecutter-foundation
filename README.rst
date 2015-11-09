Wagtail cookiecutter Foundation
================================

.. image:: https://travis-ci.org/chrisdev/wagtail-cookiecutter-foundation.svg?branch=master
   :target: http://travis-ci.org/chrisdev/wagtail-cookiecutter-foundation

A cookiecutter_ template for `Wagtail CMS`_ featuring `Zurb Foundation`_ front-end
framework.

.. figure:: http://i.imgur.com/xMZq2cE.gif
   :alt: Wagtail Cookiecutter Foundation

.. _cookiecutter: https://github.com/audreyr/cookiecutter
.. _`Wagtail CMS`: https://wagtail.io
.. _`Zurb Foundation`: https://foundation.zurb.com

Topics
======

- `What's included`_
- `Getting Started`_
- `Up and Running for Development`_
    - `Using make`_
    - `Manual Setup`_
- `Provisioning and Deployment`_
    - `Prerequisites`_
    - `Provisioning`_
    - `Deployment`_
    - `Ansible Variables`_
-  `Other Tasks`_
    - `Static Sites`_
    - `Image Compression`

What's included
----------------
A Django project with Wagtail_ pre-installed with support for all the
Zurb Foundation`_ HTML, CSS and Javascript components (typography, forms, buttons,
navigation and other interface components)

App Modules
^^^^^^^^^^^^
We provide a comprehensive suite of apps to use for building your site.
We take  a modular approach so that can pick and choose the functionality you
want to include. We provide separate modules for:

    - ``pages`` - Different kinds of pages including, Homepage, Standard Pages, 
    - ``blog`` - Blog or site news
    - ``contact`` - Contact Page with included contact form 
    - ``events`` - Events
    - ``photo_gallery`` - Create photo galleries using wagtail tags
    - ``documents`` - Create and organize documents in folders using wagtail tags 
    - ``products`` - use for a product or portfolio showcase
    -  ``feeds`` - RSS/Atom feeds which support enclosures 
        (e.g image and video embeds and work services like feedburner and mailchimp
    - ``utils`` - Various utility functions, templatetags and filters

The projects spun up with wagtail-cookiecutter-foundation have a modular structure 
so you can pick the modules that you want to included in  in your project.

Photo Gallery Module
"""""""""""""""""""""

The Photo Gallery module allows you to easily create Photo Galleries for your site
Using the built in tagging funcitonality.  To create Photo Galleries  

    * Go to Images section of the Wagtail Admin and click on Add an Image.

    * Drag and drop images you want in your gallery and add common tag name to all Images. 
      You can also add same tag name to any existing images that you want 
      to the gallery.

    * Next create a Gallery Index Page which displays all your galleries.

    * Add a Gallery Child Page and enter the tags of the Images that you want
      to appear in the Gallery. You can also choose a feed image so it can appear
      in Gallery index page.

    * Your Gallery is now created with all images you want. Awesome, right?

Documents Folder 
""""""""""""""""

This module allows to organize documents in "folders" based on tags. 

    * Go to Documents section in Wagtail Admin.

    * Add add a common tag name to all documents that you want to appear in the folder. 

    * Now create a Document Index page which displays all your Document folders.

    * Create a Document Folder Child Page and enter the tags for the document that you
      want to appear in the folder. 

    * The Folder is now created with all the Documents matching the tags you want.
      Awesome, right?

.. _Wagtail: https://wagtail.io
.. _`Wagtail Demo Project`: https://github.com/torchbox/wagtaildemo


Feeds 
"""""""""
To do

Other Components
"""""""""""""""""
- We provide templates and templatetags to support all the major Foundation ``HTML`` 
  and ``CSS`` UI components including:

    - Top bar including (sticky nav)
    - Off canvas menu
    - Bread crumbs
    - SubNav
    - Pagination
    - Reveals  

- We also provide comprehensive set of  `make` commands to  help you to  perform
  key development, provisioning and deployment tasks.

- libsass_ Foundation Sass support through `django-compressor`_/`django-libsass`_

- Front end dependency management with Bower_ 
  

- Deployment and provisioning using Ansible_ that has been extensively tested on
  Digital Ocean and Linode VPSs but should work on other 
  platforms. You you can drive the Ansible playbooks using 
  a set of simple make commands

- Image optimization using Grunt

.. _`torchbox/wagtail base box`: https://github.com/torchbox/vagrant-wagtail-base
.. _Ansible: http://www.ansible.com/home
.. _libsass: https://github.com/sass/libsass
.. _django-compressor: https://github.com/sass/libsass
.. _django-libsass: https://github.com/torchbox/django-libsass
.. _Bower: http://bower.io
.. _Gulp: https://gulpjs.com
.. _Grunt: https://gruntjs.com
.. _Vagrant: https://www.vagrantup.com/

Getting Started
----------------

To create a new `Wagtail CMS`_ project. First, install cookiecutter ::

    $ pip install cookiecutter

Now run it against this repo ::

    $ cookiecutter https://github.com/chrisdev/wagtail-cookiecutter-foundation.git

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


Enter the project and take a look around::

    $ cd wagtaiproject/
    $ ls

Create a GitHub or Bitbucket repo for the project and push it there::

    $ git init
    $ git add .
    $ git commit -m "first awesome commit"
    $ git remote add origin git@github.com:cclarke/my_site.git
    $ git push -u origin master


Up and Running for Development
-------------------------------

Before you start ensure that you've installed
the following.

    * pip
    * virtualenv/pyvenv/virtualenvwrapper
    * PostgreSQL
    * node, npm and git and bower

The easiest way to get started is to use the built in ``make`` commands.

Using make
^^^^^^^^^^

Your project contains Makefile which helps to you setup your development 
environment with a single command. Additionally, we've included 
commands which will allow you to easily provision your servers  
and deploy changes to your project easily.  

The Makefile supports the full range of development tasks. Namely creating
a virtualenv_ for the project, installing requirements_, creating a database
(db_):, running migrations (migrate_). Loading initial page structure for the
site (initial_data_), install front-end components with bower_, starting the
development server (runserver_). Using the livereload_ utility and running your
unit (test_) and functional (func_test_). 

all
""""
This is a "do all" command. Run it! ::

  make all

This command will create the projects virtual environment, 
install all python dependencies,  create
the database, run migrations and load initial data to database,
install front-end dependencies and finally start the development server 
for you. Awesome, right?

Access your site at ``http://localhost:8000``. The Admin 
back-end is available at ``http://localhost:8000/admin/``.
The default Admin username is *admin*.  
The default Admin password is *admin123*

virtualenv
"""""""""""
To create the virtualenv for the project. ::

  make virtualenv

requirements
"""""""""""""
Install the requirements to the virtualenv ::

  make requirements 

db
"""
Create a PostgreSQL database for the project. It will have the same name as the
project ::

  make db 

migrate
""""""""
Run the migrations ::

  make db 


initial_data
""""""""""""
Populate the site with initial page structure. ::

  make initial_data 

bower
"""""
Install all front-end dependencies with bower i.e `foundation`, `bxslider` and 
`font-awesome` ::

  make initial_data 

runserver
"""""""""
Start the standard Django dev server. ::

   make runserver

livereload
""""""""""
Start Server with livereload functionality. Uses the excellent 
`python-livereload`_ library. ::

    make linvreload

.. _python-livereload: https://github.com/lepture/python-livereload   

test
""""
Run your unit tests.::  

    make test

func_test
"""""""""
Run your functional tests. ::

    make func_test



Manual Setup 
^^^^^^^^^^^^^

Firstly, start your command shell and change to the new projects directory.
So on Linux or OS X ::

   cd project_repo
    
Next create an virtual environment for the project   
On Linux/Mac OSX ::

  pyvenv venv`

On Windows ::

   c:\Python34\python -m venv myenv`

If you are not using Python 3.3 or later ``pyvenv`` is not bundled with your
Python distribution and you need to install the ``virtualenv`` package to  
get the virtual environments working:

  .. code-block:: bash

      pip install virtualenv
      virtualenv venv

In this regard, you may find the  virtualenvwrapper_ package useful as it 
provides a number of commands and utilities which makes working with virtual
environments much more pleasant. It also places all your virtual environments
in one place.

To install (make sure virtualenv is already installed):

  .. code-block:: bash

      pip install virtualenvwrapper
      export WORKON_HOME=~/Envs
      source /usr/local/bin/virtualenvwrapper.sh
      mkvirtualenv venv

On Windows 

  .. code-block:: bash

      pip install virtualenvwrapper-win
      mkvirtualenv venv

  .. _virtualenvwrapper: http://virtualenvwrapper.readthedocs.org/en/latest/index.html

Once your virtual environment is setup activate it 
 on Linux/Mac OSX :: 

   source venv/bin/activate

On Windows ::

   venv/Scripts/activate.bat

Using Virtualenvwrapper ::

   `workon venv`

Install the dependencies for the project using ``pip`` ::

  pip install -r requirements/dev.txt


Create the database and run migrations. Remember this cookiecutter requires
``PostgreSQL`` so you need to install it before you can continue.

.. code-block:: sh

    createdb my_site
   ./manage.py migrate

``wagtail-cookiecutter-foundation`` comes with some pages already created for your
convenience including the homepage with a working ``bx_slider`` slideshow, 
contact page, events and news/blog pages. To generate these pages run ::

  /manage.py load_initial_data
  
The default Admin username is *admin*.  The default Admin password is *admin123*

This cookiecutter also has front-end dependencies for Foundation, 
Font-Awesome etc, bx_slider, Grunt and so on. We use bower_ 
for front-end dependency management. To install the required front-end 
dependencies use::

  bower install`

This will install the supported version of `Zurb Foundation`_, `Font
Awesome`_ , bxSlider_ and Grunt as well as their dependencies.

  ..  _bower: http://bower.io
  ..  _bxSlider: http://bxslider.com
  ..  _`Font Awesome`: http://fontawesome.io 

  
Finally start the development server ::

  ./manage.py runserver

Your site is now accessible at ``http://localhost:8000``,
with the admin backend available at ``http://localhost:8000/admin/``.
The default Admin username is *admin*.  The default Admin password is *admin123*

.. _Nodejs: https://nodejs.org/
.. _Vagrant: https://www.vagrantup.com/


Provisioning and Deployment
----------------------------

This cookiecutter comes with a suite of Ansible_ playbooks to
support provisioning your servers and deploying changes to production and
staging.  We also support the creation of a Vagrant based staging server so you
can "stage" your site locally and tweak and experiment with different
deployment configurations.  To keep things simple we assume that all your
application components i.e.  ``Django``, ``PostgreSQL``, ``redis`` and so on
are all deployed on a single server.  
However, it is a relatively straightforward
procedure to tweak the playbooks to support more complex provisioning
scenarios. In this way you can support for example, separate database server,
multiple upstream ``wsgi`` servers and so on.  Indeed you easily tweak the
Vagrantfile located at ``project_repo/ansible/Vagrantfile`` to experiment with
and test these more complex provisioning scenarios. on.

Prerequisites
^^^^^^^^^^^^^^^

Before you start you need to place a copy of your `ssh` public 
SSH key in the `keystore` directory located in `ansible/{{repo_name}}_keystore`  
and rename it a `authorized_keys`. Add the ssh keys of any team members that
you want to run the provisioning and deployment tasks.

Also if you want to use SSL then, you need to ensure that you also have  
the following key files in the ``keystore`` directory:

    * The private key for your site
    * The bundled SSL certificate obtained from the CA which contains the 
      root and intermediate certificates along with your domains certificate.
      In some cases these may not be bundled but provided separately in which
      case you must consult your CA's documentation on how to build your own
      bundle.
    * The CA's bundled root and intermediate certificate. This is use for
      certificate pinning.

In case you were wondering, the your projects ``.gitignore`` or ``.hgignore`` 
files will ensure that any of the files that you  place in the  ``keystore`` 
directory will be ignored by the VCS.  However, you
should always double check to ensure that your secrets are not accidentally
checked into a remote VCS repo.

Alternatively, may wish to consider the use the `Ansible Vault`_ to keep your
secrets safe.

.. _`Ansible Vault`: http://docs.ansible.com/ansible/playbooks_vault.html 

Next examine the generated `ansible/group_vars/all` file and replace 
the following to match your SSL key files ::

    ssl_private_key: your_ssl_private_key
    ssl_cert:  your_ssl_certificate_bundle¬
    ca_cert: comodo.pem

You must also ensure you that you provide values for the following entries 
in  your `ansible/host_vars/{{production_host_name}}` file ::

    SECRET_KEY: your_django_secret_key 
    DB_PASSWD: your_db_password 
    DB_HOST: localhost
    EMAIL_HOST: 'your_email_server'
    EMAIL_FROM: 'your_email_from_address'
    EMAIL_USER: 'email_user'
    EMAIL_PASSWD: 'email_passwd'
    GOOGLE_TRACKING_ID: 'your_google_tracking_id

Provisioning
^^^^^^^^^^^^^

The provisioning playbooks will:

  - Create the  deployment user and download deployment keys for github.com,
    bitbucket.org, etc.
  - Install all the required Linux packages on the server including the 
    UWF firewall and the fail2ban utility.
  - Install and configure PostgresSQL and a PostreSQL role (user) for the site
  - Clone the projects repo and setup and Django and Gunicorn project 
    instance that is managed by supervior
  - install and configre Redis, Celery and Elasticsearch
  - Set up and configure Nginx for you site 

Creating a Deploymet User
""""""""""""""""""""""""""
The first thing that you must do is to create a deployment user.
To create the deploy user for the production ::

    make deploy_user

This will create the deploy user for the production server. For staging run ::

    make deploy_user DEPLOY_ENV=staging

and if you want to use a Vagrant based staging server ::

.. code-block:: sh

   cd /my_project/ansible
   vagrant up

    make deploy_user DEPLOY_ENV=vagrant

When prompted for the password, enter "vagrant" If you get the following error ::

    fatal: [staging.example.org] => {'msg': 'FAILED: Authentication failed.', 'failed': True}``

The you may have to remove the entry (IP Address 192.168.33.10) for the staging
server from your ``~/.ssh/known_hosts`` file.

In addition to creating the deploy user, this make command will 
download the ``ssh`` public key for the deployment user into your project's
``keystore`` directory so you can use it as a deployment key on sites 
like github.com or bitbucket.org  

Other Provisionig Task
"""""""""""""""""""""""

Once you have setup the deployment user you can now provision the server. 
This will install all the Linux packages and libraries required to run Django,
PostgreSQL and related apps.  We also take care to install ``ufw`` firewall and
``fail2ban``. Provisioning tasks also include; the setting up the project's
virtual environment, the installation of python dependencies, 
the setup and configuration of the project's Django/Gunicorn and Supervisor, 
as well as the installation and setting up the 
projects Celery, Redis, ElasticSearch and Nginx.  

To provision the production server ::

    make provision

For staging run ::

    make provision DEPLOY_ENV=staging

for a Vagrant based staging server run ::

    make provision DEPLOY_ENV=vagrant

At the end of the process you should  be able to navigate to the
host URL to view the site and access the Admin using the password specified in
in ``ansible/host_vars/{{production_host_name}}``

Deployment
^^^^^^^^^^
Once you have provisioned your site. Deploying you changes is really simple.
To deploy to production run: ::

    make deploy 

For staging run ::

    make deploy_user DEPLOY_ENV=staging

and for a Vagrant based staging server ::

    make deploy_user DEPLOY_ENV=staging


Ansible Variables
^^^^^^^^^^^^^^^^^^

Before you run the provisioning and deployment playbooks you need check and
modify Ansible ``Group`` and ``Host`` Variables (e.g.  ``host_vars/staging.example.org``). 

Group Variables
"""""""""""""""""

===============     ====================================================
Variable            Explanation
===============     ====================================================
project_repo        URL of the source code repository
                    ssh://hg@bitbucket.org/chrisdev/wagtail_project
virtualenvs_dir     Defaults to /home/django/virtualenvs/
sites_dir           Where all your projects live on the 
                    remote server. Defaults to /usr/local/sites
nginx_root_dir      Defaults to /etc/nginx/sites-available
gunicorn            127.0.0.1:2015
deploy_user         Defaults to django
redis_version       The version of redis to install. Defaults to 2.8.19
keystore_path       Place all your 
                    public keys and other secrets here. 
                    Defaults to repo_name/ansible/repo_name_keystore 
vcs                 Your Version control system of choice 
                    *hg* - mecurial 
                    *git* - git
===============     ====================================================

Host Variables
"""""""""""""""

======================  ====================================================
Variable                Explanation
======================  ====================================================
use_ssl                 True
ssl_key_file            For example ``example.org.key``
ssl_cert_bundle         The "bundled" certificate ``bundle.example.org.crt``
SECRET_KEY              The Django secret key. Generate a new key especially
                        if this is going to be a production deployment
DJANGO_SETTINGS_MODULE  Defaults to ``wagtail_project.settings.production``
HOST_NAME               This is will be set to  as the ``server_name``
                        in the nginx virtualhost.
DB_USER                 Defaults to django
DB_PASSWD               The database password you must set a value for this 
DB_HOST                 Defaults to ``localhost``
DB_NAME                 The name of the database used in production 
                        Defaults to cookiecutter.repo_name_db 
EMAIL_HOST              The SMTP email host name e.g. ``smtp.mandrillapp.com``
EMAIL_FROM              support@chrisdev.com
EMAIL_USER              The email user 
EMAIL_PASSWD            The email password 
======================  ====================================================

Other Tasks
-----------

Static Sites
^^^^^^^^^^^^^

You can use `make` to generate a static site from the project. The static site
will be in a folder `static_build`.  The command will ensure that all static
assets and media required for the site to perform correctly are copied to the 
build folder ::

    make static_site

Image Compression
^^^^^^^^^^^^^^^^^^

To compress images used in projects made with this cookiecutter run: ::

  grunt imagemin

You can also use make to run the above task ::

   make compress_images

.. end-here
