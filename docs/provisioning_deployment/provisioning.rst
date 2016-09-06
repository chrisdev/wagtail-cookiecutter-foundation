Provisioning
============

The provisioning playbooks will:

  - Create a deployment user and download the public key of this user to the ``ansible/{{cookiecutter.project_slug}}_keystore/`` directory. This can then be used as a deployment key for services like github.com, bitbucket.org, etc.
  - Install all the required Linux packages ans libraries on the server.
  - Setup basic security  on the Linux box using `UFW Firewall`_ and `fail2ban`_.
  - Install and configure PostgresSQL. 
  - Install and configure Redis and ElasticSearch.
  - Clone the project's VCS repository, setup a virtual environment and install all python dependencies
  - Configure and install a Celery worker process
  - Install and configure Nginx and setup a VCS for you site 

.. _`UFW Firewall`: https://help.ubuntu.com/community/UFW  
.. _fail2ban: http://www.fail2ban.org/wiki/index.php/Main_Page


Provisioning your Site
----------------------

Now we want to populate your site with all the project's requirements ::

    make provision
    

Populate .env With Your Environment Variables
---------------------------------------------

Some of these services rely on environment variables set by you. There is an env.example file in the root directory of this project as a starting point. Add your own variables to the file, then move it to the ``ansible/{{cookiecutter.project_slug}}_keystore/`` folder and change the file name to ``env.production``. After you have change the file name set the ``DJANGO_DEBUG`` to ``off``.