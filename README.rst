Wagtail cookiecutter Foundation
================================

.. image:: https://travis-ci.org/chrisdev/wagtail-cookiecutter-foundation.svg?branch=master
   :target: http://travis-ci.org/chrisdev/wagtail-cookiecutter-foundation

A cookiecutter_ template for `Wagtail CMS`_ featuring the `Zurb Foundation`_ 
front-end framework. **Note the master branch of the project is now based on Foundation 6**.
The release tagged ``0.0.2`` is based on Foundation 5.  
A demo of a default project generated from this cookiecutter is available at http://wagtail.chrisdev.com.


.. figure:: http://i.imgur.com/vNRQDGj.gif
   :alt: Wagtail Cookiecutter Foundation


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
    - `Image Compression`_
-  `Contributing`_

More detailed documentation can be found on `Read the Docs`_ 

What's included
----------------
A Django project with Wagtail_ pre-installed with support for all the
`Zurb Foundation`_ HTML, CSS and Javascript components (typography, forms, buttons,
navigation and other interface components)

.. _cookiecutter: https://github.com/audreyr/cookiecutter
.. _`Wagtail CMS`: https://wagtail.io
.. _`Zurb Foundation`: https://foundation.zurb.com
.. _`Read the Docs`: http://wagtail-cookiecutter-foundation.readthedocs.org/en/latest/ 

Migrating from Foundation 5 to Foundation 6
--------------------------------------------
Bower Install
""""""""""""""
In the bower.json change - "foundation": "~5.5.3"  to "foundation-sites": "~6.1.0"

Modernizr
""""""""""""""
Modernizr has been removed from foundation 6 so it can be removed from your base.html

New Top-bar
""""""""""""""
`The entire code for the topbar has been changed`_

New Off Canvas
"""""""""""""""
* `The entire code for the offcanvas has been changed`_
* `The drop down for off canvas can now use accordion vertical menu`_

Block Grid Changed
"""""""""""""""""""
`The html for a block grid has changed`_ : eg. medium-block-grid-4 to medium-up-4

Clearing Box changes to Lightbox2
""""""""""""""""""""""""""""""""""
In foundation 6 there is no more clearing box which was used for the photo gallery so you can implement Lightbox2. Also the class “th” has been changed to “thumbnail”.
`Lightbox2 documentation`_ : Install with bower - “lightbox2": "~2.8.2"

SASS changes
""""""""""""""
`New SASS documentation`_

.. _`The entire code for the topbar has been changed`: http://foundation.zurb.com/sites/docs/top-bar.html
.. _`The entire code for the offcanvas has been changed`: http://foundation.zurb.com/sites/docs/off-canvas.html
.. _`The drop down for off canvas can now use accordion vertical menu`: http://foundation.zurb.com/sites/docs/accordion-menu.html
.. _`The html for a block grid has changed`: http://foundation.zurb.com/sites/docs/grid.html
.. _`Lightbox2 documentation`: http://lokeshdhakar.com/projects/lightbox2/
.. _`New SASS documentation` : http://foundation.zurb.com/sites/docs/sass.html

App Modules
^^^^^^^^^^^^
We provide a comprehensive suite of apps to use for building your site.
We take  a modular approach so that can pick and choose the functionality you
want to include. We provide separate modules for:

    - ``pages`` - Different kinds of pages including, Homepage, Standard Pages, Faqs Page etc.
    - ``blog`` - Blog or site news
    - ``contact`` - Contact Page with included contact us form 
    - ``events`` - Events
    - ``photo_gallery`` - Create photo galleries using wagtail tags
    - ``documents`` - Organize documents in folders using wagtail tags .
    - ``products`` - Ideal for a product or portfolio showcase
    - ``feeds`` - RSS/Atom feeds which support enclosures. 
        (e.g image and video embeds and work with services like feedburner and mailchimp)
    - ``people`` - For the people in your organization or team. 
    - ``faq`` - FAQ and answers.
    - ``utils`` - Various utility functions, templatetags and filters

The projects spun up with ``wagtail-cookiecutter-foundation`` are modular  
so you can pick and choose the modules that you want to include in  in your project.

Photo Gallery
""""""""""""""
The Photo Gallery module allows you to easily create Photo Galleries for your site
Using the built in tagging functionality.  To create Photo Galleries  

    * Go to Images section of the Wagtail Admin and click on Add an Image.

    * Drag and drop images you want in your gallery and add common tag 
      name to all the uploaded Images.  You can also add same tag name 
      to any existing images that you want to include in the gallery.

    * Next create a Gallery Index Page which displays all your galleries.

    * Add a Gallery Child Page and enter the tags of the Images that you want
      to appear in the Gallery. You can also choose a feed image so it can appear
      in Gallery index page.

    * Your Gallery is now created with all images you want. Awesome, right?

Documents Folder 
""""""""""""""""""
This module allows to organize documents into "folders" based on common tags.  
In many ways It works the same way as the Photo Gallery module. 

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
"""""""
Syndication feeds come in two flavors:

 - BasicFeed -  A standard `RSS V 2.0.1`_ feed designed to be used without 
   item enclosures.

 - ExtendedFeed - An RSS V2/Atom Feed with support for item  
   enclosures such as images or video. Use this if when want to integrate your
   feed with services like MailChimp or Flipboard.

The `feeds`  module provides the flexibility of allowing you to specify the app
module, PageModel and data fields to use for the feed. This is current being
done through settings variables. In future versions we plan to provide a page
model for truly plug and play functionality. For example, if we wish to create
a Syndication Feed based on the `BlogPage` model which is the `blog` app.  ::

    FEED_APP_LABEL = 'blog'
    FEED_MODEL_NAME = 'BlogPage'

To specify the use of the `BlogPage.intro` as for the item description and 
The `body` field for the content enclosure add the following to your
settings.::

    FEED_ITEM_DESCRIPTION_FIELD = 'intro'
    FEED_ITEM_CONTENT_FIELD = 'body'

Then add the feed level attributes to the settings as follows: ::

    FEED_TITLE = 'From the Desk of John Blog'
    FEED_LINK = '/news/'
    FEED_DESCRIPTION = "News and views from around the Web"
    FEED_AUTHOR_EMAIL = 'john@johnblog.com'
    FEED_AUTHOR_LINK = 'https://johnblog.com'

Finally reference it in the `url.py` ::

    url(r'^blog/feed/basic$', BasicFeed(), name='basic_feed'),
    url(r'^blog/feed/extended$', ExtendedFeed(), name='extended_feed'),

.. _`RSS V 2.0.1` : http://cyber.law.harvard.edu/rss/rss.html

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
  
- Server provisioning and deployment using Ansible_ that has been extensively tested on
  Digital Ocean and Linode VPSs but it should work on other 
  platforms. You can drive the Ansible playbooks using a set of make commands.

- Image optimization using Grunt

.. _`torchbox/wagtail base box`: https://github.com/torchbox/vagrant-wagtail-base
.. _Ansible: http://www.ansible.com/home
.. _libsass: https://github.com/sass/libsass
.. _django-compressor: https://github.com/sass/libsass
.. _django-libsass: https://github.com/torchbox/django-libsass
.. _Bower: http://bower.io
.. _Gulp: https://gulpjs.com
.. _Grunt: https://gruntjs.com

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

Create a GitHub or Bitbucket repo for the project and push it there::

    $ git init
    $ git add .
    $ git commit -m "first awesome commit"
    $ git remote add origin git@github.com:cclarke/my_site.git
    $ git push -u origin master


Up and Running for Development
-------------------------------

Before you start ensure that you've installed and got the following working.

    * pip
    * virtualenv/pyvenv/virtualenvwrapper
    * PostgreSQL
    * node, npm and git and bower

The easiest way to get started is to use the built in ``make`` commands.

Using make
^^^^^^^^^^

Your project contains a Makefile that allows you to setup your development 
environment with a single command. To do this run ::

  make all

This command will create your project's virtual environment, 
install all pip dependencies,  create
the development database, run migrations and load initial data to database,
install front-end dependencies and finally start the development server 
for you. Awesome, right?

You can access your site at ``http://localhost:8000``. The Admin 
back-end is available at ``http://localhost:8000/admin/``.
The default Admin username is *admin* and The default Admin password is
*admin123*

The make command available for development are discussed in more detail below.

virtualenv
"""""""""""
Create the virtualenv for the project. ::

  make virtualenv

The virtual environment is located in your project's ``venv`` directory.

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

  make migrate 


initial_data
""""""""""""
Populate the site with initial page structure. ::

  make initial_data 

bower
"""""
Install all front-end dependencies with bower i.e `foundation`, `bxslider` and 
`font-awesome` ::

  make bower 

runserver
"""""""""
Start the standard Django dev server. ::

   make runserver

livereload
""""""""""
Start Server with livereload functionality. Uses the excellent 
`python-livereload`_ library. ::

    make livereload

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
You can also set up your development environment manually.
Firstly, start your command shell and change to the new project's directory.
So on Linux or OS X ::

   cd project_repo
    
Next create an virtual environment for the project   
On Linux/Mac OSX ::

  pyvenv venv

On Windows ::

   c:\Python34\python -m venv myenv

If you are not using Python 3.3 or later ``pyvenv`` is not bundled with your
Python distribution and you need to install the ``virtualenv`` package to  
get the virtual environments working. ::

      pip install virtualenv
      virtualenv venv

In this regard, you may find the  virtualenvwrapper_ package useful as it 
provides a number of commands and utilities which makes working with virtual
environments much more pleasant. It also places all your virtual environments
in one place.

To install (make sure virtualenv is already installed) ::

    pip install virtualenvwrapper
    export WORKON_HOME=~/Envs
    source /usr/local/bin/virtualenvwrapper.sh
    mkvirtualenv venv

On Windows ::

    pip install virtualenvwrapper-win
    mkvirtualenv venv

.. _virtualenvwrapper: http://virtualenvwrapper.readthedocs.org/en/latest/index.html

Once your virtual environment is setup activate it on Linux/Mac OSX :: 

   source venv/bin/activate

On Windows ::

   venv/Scripts/activate.bat

Using Virtualenvwrapper ::

   workon venv

Install the dependencies for the project using ``pip`` ::

  pip install -r requirements/dev.txt


Create the database and run migrations. Remember this cookiecutter requires
``PostgreSQL`` so you need to install it before you can continue. ::

    createdb my_site
    ./manage.py migrate

``wagtail-cookiecutter-foundation`` comes with some pages already created for your
convenience including the homepage with a working ``bx_slider`` slideshow, 
contact page, events and news/blog pages. To generate these pages run ::

  /manage.py load_initial_data
  
The default Admin username is *admin*.  The default Admin password is *admin123*

This cookiecutter also has front-end dependencies for Foundation, 
Font-Awesome etc and bx_slider. We use bower_ 
for front-end dependency management. To install the required front-end 
dependencies use: ::

   cd project_repo
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


Provisioning and Deployment
----------------------------

You project comes with a suite of Ansible_ playbooks to
support the provisioning your servers and deploying changes to production and
staging.  We also support the creation of a Vagrant_ based staging server so you
can "stage" your site locally and tweak and experiment with different
deployment configurations.  To keep things simple we assume that all your
application components i.e.  ``Django``, ``PostgreSQL``, ``redis`` and so on
are all deployed on a single server.  
However, it is a relatively straightforward
procedure to tweak the playbooks to support more complex provisioning
scenarios. In this way, you can support for example, separate database server,
multiple upstream ``wsgi`` servers and so on.  Indeed, you easily tweak the
``Vagrantfile`` located at ``project_repo/ansible/Vagrantfile`` to experiment with
and test these more complex provisioning scenarios. on.

.. _Vagrant: https://docs.vagrantup.com/v2/

Prerequisites
^^^^^^^^^^^^^^^
To reiterate you need to have the following already installed
    * Python 2.7/3.5
    * pip
    * virtualenv/pyvenv/virtualenvwrapper
    * PostgreSQL
    * VirtualBox or VMWare/Vagrant (required for vagrant staging)
    * Ansible
    * node, npm and git and bower

Next, you need to place a copy of your `ssh` public 
key in the `keystore` directory located in `ansible/{{repo_name}}_keystore`  
and rename it a `authorized_keys`. Remember to add the ssh keys of 
any team members that you want to run the provisioning and deployment tasks.

Also if you want to use SSL then you need to ensure that you also have  
the following key files in the ``keystore`` directory:

    * The private key for your site
    * The bundled SSL certificate obtained from the CA which contains the 
      root and intermediate certificates along with your domains certificate.
      In some cases, these may not be bundled but provided separately in which
      case you must consult your CA's documentation on how to build your own
      bundle.
    * The CA's bundled root and intermediate certificate. This is used to
      support `certificate pinning`_.

In case you were wondering, the generated ``.gitignore`` or ``.hgignore`` will
exclude any of  the files in the ``keystore`` from your VCS repository.
However, you should always double check to ensure that your secrets are not
accidentally checked into a remote VCS repo.

Alternatively, may wish to consider the use the `Ansible Vault`_ to keep you
secrets safe

.. _`certificate pinning`: https://www.owasp.org/index.php/Certificate_and_Public_Key_Pinning
.. _`Ansible Vault`: http://docs.ansible.com/ansible/playbooks_vault.html 

Next, examine the generated `ansible/group_vars/all` file and replace 
the following to match your SSL key files ::

    ssl_private_key: your_ssl_private_key_file
    ssl_cert:  your_ssl_certificate_bundle_fie¬
    ca_cert: comodo.pem_file

Finally, must also ensure you that you provide values for the following entries 
in  your `ansible/host_vars/{{production_host_name}}` file ::

    SECRET_KEY: your_django_secret_key 
    DJANGO_ADMIN: django_admim_user_name 
    DJANGO_ADMIN: your_django_admin_password
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

  - Create a deployment user and download the public key of this user to the
    ``keystore`` directory.  This can then be used as a 
    deployment key for services like github.com, bitbucket.org, etc.
  - Install all the required Linux packages ans libraries on the server.
  - Setup basic security  on the Linux box using `UFW Firewall`_ and 
    `fail2ban`_.
  - Install and configure PostgresSQL. 
  - Install and configure Redis and ElasticSearch.
  - Clone the project's VCS repository, setup a virtual environment 
    and install all python dependencies
  - Configure and install a Celery worker process
  - Install and configure Nginx and setup a VCS for you site 

.. _`UFW Firewall`: https://help.ubuntu.com/community/UFW  
.. _fail2ban: http://www.fail2ban.org/wiki/index.php/Main_Page 

Creating a Deployment User
""""""""""""""""""""""""""
The first thing that you must do is to create a deployment user.
To create the deploy user for the production ::

    make deploy_user

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

You may have to remove the entry (IP Address 192.168.33.10) for the staging
server from your ``~/.ssh/known_hosts`` file.

In addition,  to creating the deploy user, this make command will 
download the RSA ``ssh`` public key for the deployment user into your project's
``keystore`` directory so you can use it as a deployment key on sites 
like github.com or bitbucket.org  

Other Provisioning Task
"""""""""""""""""""""""
Once the deployment user has been created and the deployment keys added to
your VCS repository, you can now run the other provisioning tasks. To provision 
the production server ::

    make provision

For the staging server run ::

    make provision DEPLOY_ENV=staging

To provision the Vagrant based staging server run ::

    make provision DEPLOY_ENV=vagrant

At the end of the process you should be able to navigate to the
host URL to view the site and access the Admin using the password specified
in. ::

    DJANGO_ADMIN: django_admim_user_name 
    DJANGO_ADMIN: your_django_admin_password

Deployment
^^^^^^^^^^
Once you have provisioned your site. Deploying you changes is really simple.
To deploy to production run: ::

    make deploy 

For staging run ::

    make deploy_user DEPLOY_ENV=staging

and for a Vagrant based staging server ::

    make deploy_user DEPLOY_ENV=staging

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

To compress images used in project's made with this cookiecutter run: ::

  grunt imagemin

You can also use make to run the above task ::

   make compress_images


Ansible Variables
-----------------

Group Variables
^^^^^^^^^^^^^^^^

===============     ====================================================
Variable            Explanation
===============     ====================================================
project_repo        URL of the source code repository
                    ssh://hg@bitbucket.org/chrisdev/wagtail_project
virtualenvs_dir     Defaults to /home/django/virtualenvs/
sites_dir           Where all your project's live on the 
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
^^^^^^^^^^^^^^^^

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
DJANGO_ADMIN:           django_admim_user_name 
DJANGO_ADMIN:           your_django_admin_password
DB_PASSWD               The database password you must set a value for this 
DB_HOST                 Defaults to ``localhost``
DB_NAME                 The name of the database used in production 
                        Defaults to cookiecutter.repo_name_db 
EMAIL_HOST              The SMTP email host name e.g. ``smtp.mandrillapp.com``
EMAIL_FROM              support@chrisdev.com
EMAIL_USER              The email user 
EMAIL_PASSWD            The email password 
======================  ====================================================

Contributing
------------

Contributions are always welcome to improve this project. If you think you've found a bug or are interested in contributing fork this project and send the pull request. After review, your pull request will be merged. We are always happy to receive pull requests. If you identify any issue, please raise it in the issues section.

.. end-here
