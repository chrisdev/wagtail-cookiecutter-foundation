Installation
============

Let's pretend you want to create a Django project called "wagtail_project". Rather than using `startproject` and then editing the results to include your name, email, and various configuration issues that always get forgotten until the worst possible moment, get cookiecutter_ to do all the work.

.. _cookiecutter: https://github.com/audreyr/cookiecutter

First, get Cookiecutter ::

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

Enter the project and take a look around::

    $ cd wagtail_project/
    $ ls

Create a git repo and push it there::

    $ git init
    $ git add .
    $ git commit -m "first awesome commit"
    $ git remote add origin git@github.com:cclarke/my_site.git
    $ git push -u origin master