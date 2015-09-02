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

.. _Ansible: http://www.ansible.com/home