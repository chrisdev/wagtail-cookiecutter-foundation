Deployment
===========

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