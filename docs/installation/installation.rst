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
    remote: Counting objects: 5355, done.
    remote: Compressing objects: 100% (10/10), done.
    remote: Total 5355 (delta 4), reused 0 (delta 0), pack-reused 5345
    Receiving objects: 100% (5355/5355), 11.77 MiB | 4.39 MiB/s, done.
    Resolving deltas: 100% (3008/3008), done.
    Checking connectivity... done.
    project_name [Wagtail Project]: 
    repo_name [wagtail_project]: 
    Select version_control_system:
        1 - git
        2 - hg
        Choose from 1, 2 [1]:
    Select vcs_host:
        1 - bitbucket.org
        2 - github.com
        Choose from 1, 2 [1]: 
    vcs_repo_username [your_bitbucket_or_github_user_name]: 
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
    staging_host_name [wagtail-staging.chrisdev.com]: 
    use_vagrant_staging [True]: 
    deploy_user_name [django]: 
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