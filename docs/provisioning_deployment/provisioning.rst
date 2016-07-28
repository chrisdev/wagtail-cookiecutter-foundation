Provisioning
============

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


Other Provisioning Task
-------------------------
Once the deployment user has been created and the deployment keys added to your VCS repository, you can now run the other provisioning tasks. To provision the production server ::

    make provision

For the staging server run ::

    make provision DEPLOY_ENV=staging

To provision the Vagrant based staging server run ::

    make provision DEPLOY_ENV=vagrant

At the end of the process you should be able to navigate to the host URL to view the site and access the Admin using the password specified in. ::

    DJANGO_ADMIN: django_admim_user_name 
    DJANGO_ADMIN: your_django_admin_password