Using Vagrant for Development
=============================

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