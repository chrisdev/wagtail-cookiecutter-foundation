Wagtail Cookiecutter Foundation
================================

.. image:: https://pyup.io/repos/github/chrisdev/wagtail-cookiecutter-foundation/shield.svg
     :target: https://pyup.io/repos/github/chrisdev/wagtail-cookiecutter-foundation/
     :alt: Updates
.. image:: https://travis-ci.org/chrisdev/wagtail-cookiecutter-foundation.svg?branch=master
   :target: https://travis-ci.org/chrisdev/wagtail-cookiecutter-foundation
   
A cookiecutter_ template for `Wagtail CMS`_ was built using `Zurb Foundation`_ 
front-end framework. A demo of a default project generated from this cookiecutter is available at https://wagtail-demo.chrisdev.com.

.. figure:: http://i.imgur.com/FGJtr78.gif :alt: Wagtail Cookiecutter Foundation


Read the Docs: http://wagtail-cookiecutter-foundation.readthedocs.org/en/latest/

Features
----------

A Django project with `Wagtail CMS`_ pre-installed with support for all the `Zurb Foundation`_ components.

* For Django 1.9
* Renders `Django`_ projects with 100% starting test coverage
* `Zurb Foundation`_
* 12-Factor_ based settings via django-environ_
* Optimized development and production settings
* Built with `Let's Encrypt`_
* Comes with custom user model ready to go
* Grunt build for compass and livereload
* Ansible support for development and production
* Works with Python 2.7.x or 3.5.x

.. _cookiecutter: https://github.com/audreyr/cookiecutter
.. _`Wagtail CMS`: https://wagtail.io
.. _`Django`: https://www.djangoproject.com/
.. _`Zurb Foundation`: https://foundation.zurb.com
.. _`Let's Encrypt`: https://letsencrypt.org/
.. _`Read the Docs`: http://wagtail-cookiecutter-foundation.readthedocs.org/en/latest/
.. _django-environ: https://github.com/joke2k/django-environ
.. _12-Factor: http://12factor.net/

Getting Started
----------------
Here is how we create a new Django project quickly while letting cookiecutter_ to do all the work.

To get started we assume the following dependencies ::
    
    pip
    virtualenv/pyvenv/virtualenvwrapper
    PostgreSQL
    Bower

Get Cookiecutter ::

    $ pip install cookiecutter

Now run it against this repo::

    $ cookiecutter https://github.com/chrisdev/wagtail-cookiecutter-foundation.git

You'll be prompted for some values. Provide them, then a Django project will be created for you ::

    Cloning into 'wagtail-cookiecutter-foundation'...
    remote: Counting objects: 5849, done.
    remote: Compressing objects: 100% (129/129), done.
    remote: Total 5849 (delta 47), reused 0 (delta 0), pack-reused 5718
    Receiving objects: 100% (5849/5849), 12.43 MiB | 2.64 MiB/s, done.
    Resolving deltas: 100% (3291/3291), done.
    Checking connectivity... done.
    project_name [Wagtail Project]: 
    project_slug [wagtail_project]: 
    Select version_control_system:
        1 - git
        2 - hg
        Choose from 1, 2 [1]: 
    Select vcs_host:
        1 - bitbucket.org
        2 - github.com
        Choose from 1, 2 [1]: 
    your_bitbucket_or_github_user_name [chrisdev]: 
    author_name [Christopher Clarke]: 
    email [cclarke@chrisdev.com]: 
    description [A short description of the project.]: 
    timezone [UTC]: 
    production_host_name [wagtail.chrisdev.com]: 
    version [0.1.0]: 
    use_letsencrypt [y]: 
    use_celery [y]: 
    use_opbeat [n]: 
    use_django_cachalot [n]: 
    use_wagalytics_app [n]: 
    staging_host_name [wagtail-staging.chrisdev.com]: 
    use_vagrant_staging [True]: 
    deploy_user_name [django]: 
    database_user_name [django]: 
    django_admin_user [my_wagtail_admin]: 
    Select open_source_license:
        1 - MIT
        2 - BSD
        3 - Apache Software License 2.0
        4 - Not open source
        Choose from 1, 2, 3, 4 [1]:

Enter the project ::

    $ cd wagtail_project/

Create a git repo and push it there::

    $ git init
    $ git add .
    $ git commit -m "first awesome commit"
    $ git remote add origin git@github.com:cclarke/my_site.git
    $ git push -u origin master
    
To create your project's virtual environment, install all pip dependencies, create the development database, run migrations and load initial data to database, install front-end dependencies and finally start the development server for you run ::

	make all

You can access your site at ``http://localhost:8000``. The Admin back-end is available at ``http://localhost:8000/admin/``.The default Admin username is *admin* and The default Admin password is *admin123*.

.. _cookiecutter: https://github.com/audreyr/cookiecutter


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


Contributing
--------------

Contributions are always welcome to improve this project. If you think you've found a bug or are interested in contributing fork this project and send the pull request. After review, your pull request will be merged. We are always happy to receive pull requests. If you identify any issue, please raise it in the issues section.

.. end-here
