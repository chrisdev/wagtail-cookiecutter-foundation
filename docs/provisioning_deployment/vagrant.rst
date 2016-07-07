Using Vagrant for Development
===============================

Alternatively you may prefer to use Vagrant_ to run your project locally in
its own virtual machine. This will allow you to use PostgreSQL, Elasticsearch
Redis etc.  in development without having to install them on your host machine.
To install Vagrant, see: `Installing Vagrant`_

.. _`Installing Vagrant`: https://docs.vagrantup.com/v2/installation/


To setup the Vagrant box, run the following commands

 .. code-block:: bash

    vagrant up # This may take some time on first run
    vagrant ssh
    # within the ssh session
    bower install
    dj createsuperuser
    djrun


If you now visit http://localhost:8000 you should see the default wagtail
foundation site

You can browse the Wagtail admin interface at: http://localhost:8000/admin

You can read more about how Vagrant works at: https://docs.vagrantup.com/v2/

.. _Nodejs: https://nodejs.org/
.. _Vagrant: https://www.vagrantup.com/ 


Vagrant based Staging Server
-----------------------------
Start by changing to the ``ansible`` directory  and bringing up vagrant based
the staging server.

.. code-block:: sh

   cd /my_project/ansible
   vagrant up

Because of the way Vagrant is setup we need to run a special play book to copy
your ``ssh`` public key (``id_rsa.pub``) to the root account on the Vagrant staging machine
i.e. to ``authorised_keys``.

.. code-block:: sh

   ansible-playbook -c paramiko -i staging vagrant_staging_setup.yml --ask-pass --sudo -u vagrant 

When prompted for the password, enter "vagrant" 

If you get the following error ::

    fatal: [staging.example.org] => {'msg': 'FAILED: Authentication failed.', 'failed': True}``

The you may have to remove the entry (IP Address 192.168.33.10) for the staging
server from your ``~/.ssh/known_hosts`` file.

If you are using Vagrant staging you also need to make an entry into your
``/etc/hosts`` file for example.