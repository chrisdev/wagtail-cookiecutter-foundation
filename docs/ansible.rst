Using Ansible 
===============

This cookiecutter also comes with a suite of Ansible_ play books and roles for 
provisioning your servers and deploying the site.  We also support the creation
of a Vagrant based staging server to "stage" your site locally and allow you to tweak and
experiment with different deployment configurations. By default these play books 
assume that all your application components ``django``, ``PostgreSQL``, ``redis`` and so on are
deployed to a single server. However, we can easily change the Vagrant staging
configuration to simulate more complex deployments including using a separate
Database server, multiple upstream ``wsgi`` servers and so on.

.. _Ansible: http://www.ansible.com/home


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


Ansible Playbooks
------------------

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