You project comes with a suite of Ansible_ playbooks to support the provisioning your servers and deploying changes to production and staging.  We also support the creation of a Vagrant_ based staging server so you can "stage" your site locally and tweak and experiment with different deployment configurations.  To keep things simple we assume that all your application components i.e.  ``Django``, ``PostgreSQL``, ``redis`` and so on are all deployed on a single server.  

However, it is a relatively straightforward procedure to tweak the playbooks to support more complex provisioning scenarios. In this way, you can support for example, separate database server, multiple upstream ``wsgi`` servers and so on.  Indeed, you easily tweak the ``Vagrantfile`` located at ``project_repo/ansible/Vagrantfile`` to experiment with and test these more complex provisioning scenarios. on.

Next, you need to place a copy of your `ssh` public key in the `keystore` directory located in `ansible/{{repo_name}}_keystore` and rename it a `authorized_keys`. Remember to add the ssh keys of any team members that you want to run the provisioning and deployment tasks.

Also if you want to use SSL then you need to ensure that you also have the following key files in the ``keystore`` directory:

    * The private key for your site
    * The bundled SSL certificate obtained from the CA which contains the root and intermediate certificates along with your domains certificate. In some cases, these may not be bundled but provided separately in which case you must consult your CA's documentation on how to build your own bundle.
    * The CA's bundled root and intermediate certificate. This is used to
      support `certificate pinning`_.

In case you were wondering, the generated ``.gitignore`` or ``.hgignore`` will exclude any of  the files in the ``keystore`` from your VCS repository. However, you should always double check to ensure that your secrets are not accidentally checked into a remote VCS repo.

Alternatively, may wish to consider the use the `Ansible Vault`_ to keep you
secrets safe

.. _`certificate pinning`: https://www.owasp.org/index.php/Certificate_and_Public_Key_Pinning
.. _`Ansible Vault`: http://docs.ansible.com/ansible/playbooks_vault.html 

Next, examine the generated `ansible/group_vars/all` file and replace the following to match your SSL key files ::

    ssl_private_key: your_ssl_private_key_file
    ssl_cert:  your_ssl_certificate_bundle_fie¬
    ca_cert: comodo.pem_file

Finally, must also ensure you that you provide values for the following entries in  your `ansible/host_vars/{{production_host_name}}` file ::

    SECRET_KEY: your_django_secret_key 
    DJANGO_ADMIN: django_admim_user_name 
    DJANGO_ADMIN: your_django_admin_password
    DB_PASSWD: your_db_password 
    DB_HOST: localhost
    EMAIL_HOST: 'your_email_server'
    EMAIL_FROM: 'your_email_from_address'
    EMAIL_USER: 'email_user'
    EMAIL_PASSWD: 'email_passwd'
    GOOGLE_TRACKING_ID: ‘your_google_tracking_id

Provisioning
^^^^^^^^^^^^^^
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

Creating a Deployment User
^^^^^^^^^^^^^^^^^^^^^^^^^^^
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

Other Provisioning Task
^^^^^^^^^^^^^^^^^^^^^^^^
Once the deployment user has been created and the deployment keys added to your VCS repository, you can now run the other provisioning tasks. To provision the production server ::

    make provision

For the staging server run ::

    make provision DEPLOY_ENV=staging

To provision the Vagrant based staging server run ::

    make provision DEPLOY_ENV=vagrant

At the end of the process you should be able to navigate to the host URL to view the site and access the Admin using the password specified in. ::

    DJANGO_ADMIN: django_admim_user_name 
    DJANGO_ADMIN: your_django_admin_password

Deployment
^^^^^^^^^^^^
Once you have provisioned your site. Deploying you changes is really simple. To deploy to production run: ::

    make deploy 

For staging run ::

    make deploy_user DEPLOY_ENV=staging

and for a Vagrant based staging server ::

    make deploy_user DEPLOY_ENV=staging