For staging run ::

    make deploy_user DEPLOY_ENV=staging

and for a Vagrant based staging server ::

    make deploy_user DEPLOY_ENV=staging

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
       
For the staging server run ::

    make provision DEPLOY_ENV=staging

To provision the Vagrant based staging server run ::

    make provision DEPLOY_ENV=vagrant