Deployment
==========

Once you have provisioned your site. Deploying you changes is really simple. To deploy to production run: ::

    make deploy 

For staging run ::

    make deploy_user DEPLOY_ENV=staging

and for a Vagrant based staging server ::

    make deploy_user DEPLOY_ENV=staging
    

Creating a Deployment User
----------------------------

The first thing that you must do is to create a deployment user. To create the deploy user for the production ::

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

You may have to remove the entry (IP Address 192.168.33.10) for the staging server from your ``~/.ssh/known_hosts`` file.

In addition,  to creating the deploy user, this make command will download the RSA ``ssh`` public key for the deployment user into your project’s ``keystore`` directory so you can use it as a deployment key on sites like github.com or bitbucket.org


Populate .env With Your Environment Variables
---------------------------------------------

Some of these services rely on environment variables set by you. There is an env.example file in the root directory of this project as a starting point. Add your own variables to the file and rename it to .env. This file won’t be tracked by git by default so you’ll have to make sure to use some other mechanism to copy your secret if you are relying solely on git.

This is what the file contains::
    
    #PostgreSQL
    PROD_DATABASE_URL=psql://{{cookiecutter.database_user_name}}:change_db_password!!!@127.0.0.1:5432/{{cookiecutter.project_slug}}_db
    
    #General Settings
    DJANGO_DEBUG=on
    DJANGO_ALLOWED_HOST_NAME={{cookiecutter.production_host_name}}
    DJANGO_SECRET_KEY=change_django_secret_key!!!
    
    
    #EMAIL 
    EMAIL_HOST='email_host'
    EMAIL_FROM='support@chrisdev.com'
    EMAIL_USER='email_user'
    EMAIL_PASSWD='email_passwd'
    
    {% if cookiecutter.use_opbeat == 'y' -%}
    OPBEAT_ORGANIZATION_ID=
    OPBEAT_APP_ID=
    OPBEAT_SECRET_TOKEN=
    {% endif %}
    
After setting up this file, copy the .env file to ``ansible/{{cookiecutter.project_slug}}_keystore/`` and then set the ``DJANGO_DEBUG`` to ``off``.