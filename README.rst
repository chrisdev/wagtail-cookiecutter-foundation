Wagtail cookiecutter Foundation
================================
A cookiecutter_ template for `Wagtail CMS`_ featuring `Zurb Foundation`_ front-end
framework.

.. figure:: http://i.imgur.com/xMZq2cE.gif
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
.. _Ansible: http://www.ansible.com/home
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
    version_control_system (default is "hg")?,
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
To perform the following steps assume the following dependencies

    * pip
    * virtualenv/pyvenv/virtualenvwrapper
    * PostgreSQL
    * Bower

Firstly, open up a command line shell in your new projects directory.

**Avoid Below steps by using make**
  .. code-block:: bash

    make

This will create virtual environment, install pip requirements, create database, migrate, load initial data to database, install bower packages, run server for you. Awesome, right?
    
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

**Use** Fabric_ **to avoid below steps**

  :code:`fab install`

  This will create database, migrate, load initial data to database and install Front end packages using bower.

.. _Fabric: http://www.fabfile.org/

4. **Create the database and migrate**

  By default require ``PostgreSQL`` to be installed

.. code-block:: sh

    createdb my_site
   ./manage.py migrate

5. **Load the Initial Data**
   The cookiecutter comes with some pages already created for your
   convenience including the Homepage with a working ``bx_slider`` slide show, 
   contact page, events and news/blog pages. To generate these pages run:

  :code:`./manage.py load_initial_data`
  
  The default Admin username is *admin*
  
  The default Admin password is *admin123*

6. **Install Packages (Foundation, Font-Awesome etc.) using Bower package manager**

  We use bower_ for front-end dependency management. To install front
  dependencies use

  :code:`bower install`

  This will install the supported version of `Zurb Foundation`_, `Font
  Awesome`_ and bxSlider_ as well as their dependencies.

  ..  _bower: http://bower.io
  ..  _bxSlider: http://bxslider.com
  ..  _`Font Awesome`: http://fontawesome.io 

  
7. **Run the development server**

  :code:`./manage.py runserver`

  Your site is now accessible at ``http://localhost:8000``,
  with the admin backend available at ``http://localhost:8000/admin/``.


Using Vagrant for Development
------------------------------
Alternatively you may prefer to use Vagrant_ to run your project locally in
its own virtual machine. This will allow you to use PostgreSQL, Elasticsearch
Redis etc.  in development without having to install them on your host machine.
To install Vagrant, see: `Installing Vagrant`_

.. _`Installing Vagrant`: https://docs.vagrantup.com/v2/installation/


To setup the Vagrant box, run the following commands

 .. code-block:: bash

    vagrant up # This may take some time on first run
    vagrant ssh
    # within the ssh session
    bower install
    dj createsuperuser
    djrun


If you now visit http://localhost:8000 you should see the default wagtail
foundation site

You can browse the Wagtail admin interface at: http://localhost:8000/admin

You can read more about how Vagrant works at: https://docs.vagrantup.com/v2/

.. _Nodejs: https://nodejs.org/


Using Ansible for Deployment and Provisioning
----------------------------------------------

This cookiecutter also comes with a suite of Ansible_ play books and roles for 
provisioning your servers and deploying the site.  We also support the creation
of a Vagrant based staging server to "stage" your site locally and allow you to tweak and
experiment with different deployment configurations. By default these play books 
assume that all your application components ``django``, ``PostgreSQL``, ``redis`` and so on are
deployed to a single server. However, we can easily change the Vagrant staging
configuration to simulate more complex deployments including using a separate
Database server, multiple upstream ``wsgi`` servers and so on.

Vagrant based Staging Server
-----------------------------
Start by changing to the ``ansible`` directory  and bringing up vagrant based
the staging server.

.. code-block:: sh

   cd /my_project/ansible
   vagrant up

Because of the way Vagrant is setup we need to run a special play book to copy
your ``ssh`` public key (``id_rsa.pub``) to the root account on the Vagrant staging machine
i.e. to ``authorised_keys``.

.. code-block:: sh

   ansible-playbook -c paramiko -i staging vagrant_staging_setup.yml --ask-pass --sudo -u vagrant 

When prompted for the password, enter "vagrant" 

If you get the following error ::

    fatal: [staging.example.org] => {'msg': 'FAILED: Authentication failed.', 'failed': True}``

The you may have to remove the entry (IP Address 192.168.33.10) for the staging
server from your ``~/.ssh/known_hosts`` file.

If you are using Vagrant staging you also need to make an entry into your
``/etc/hosts`` file for example.




Ansible Variables
------------------
Before you run the provisioning and deployment playbooks you need check and
modify Ansible ``Group`` and ``Host`` Variables (e.g.  ``host_vars/staging.example.org``). 

Group Variables
***************

===============     ====================================================
variable            Explanation
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
                    public keys and other secretes   in this location. 
                    Defaults to repo_name/ansible/repo_name_keystore 
vcs                 Your Version control system 
                    *hg* - mecurial 
                    *git* - git
===============     ====================================================

Host Variables
***************

======================  ====================================================
variable                Explanation
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

Ansible Files
---------------
You also have to ensure that files that contain your various secrets are
present in in the ``keystore`` directory 
(``ansible/cookiecutter.repo_name.keystore``). Successfully completing the 
provisioning  playbook would require the following files in the ``keystore``.
The ``.gitignore`` and ``.hgignore`` files provided by this cookiecutter should
ensure that no file added to this directory is accidentally added to your VCS.

 - *Authorized Keys* - public key of the developers for e.g. ``id_rsa.pub``. You can
   concatenate keys for one or more developers and name as ``authorized_keys``
 - *SSL Private Key and Certificate* - This is required only if ``use_ssl`` 
   is ``true``. The SSL Certificate you place in this directory should be
   a "bundle" i.e a single file that includes the CA's Root and Intermediate Certificates along
   with the SSL certificate obtained for the hosts. These should be 
   concatenated in the correct order as indicated by the CA.

Playbooks
----------

To provision you servers run

.. code-block:: sh

   cd ansible
   #list the available tags 
   ansible-playbook -i staging provision.yml --list-tags 

   #Run all the plays 

   ansible-playbook -i staging provision.yml 

   #Just install Ubuntu packages 

   ansible-playbook -i staging provision.yml --tags packages


To deploy changes to production 

.. code-block:: sh

   ansible-playbook -i production deploy.yml











