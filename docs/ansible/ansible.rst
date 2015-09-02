Using Ansible
=============

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




Ansible Variables
------------------
Before you run the provisioning and deployment playbooks you need check and
modify Ansible ``Group`` and ``Host`` Variables (e.g.  ``host_vars/staging.example.org``). 

Group Variables
***************

===============     ====================================================
variable            Explanation
===============     ====================================================
project_repo        URL of the source code repository
                    ssh://hg@bitbucket.org/chrisdev/wagtail_project
virtualenvs_dir     Defaults to /home/django/virtualenvs/
sites_dir           Where all your projects live on the 
                    remote server. Defaults to /usr/local/sites
nginx_root_dir      Defaults to /etc/nginx/sites-available
gunicorn            127.0.0.1:2015
deploy_user         Defaults to django
redis_version       The version of redis to install. Defaults to 2.8.19
keystore_path       Place all your 
                    public keys and other secretes   in this location. 
                    Defaults to repo_name/ansible/repo_name_keystore 
vcs                 Your Version control system 
                    *hg* - mecurial 
                    *git* - git
===============     ====================================================

Host Variables
***************

======================  ====================================================
variable                Explanation
======================  ====================================================
use_ssl                 True
ssl_key_file            For example ``example.org.key``
ssl_cert_bundle         The "bundled" certificate ``bundle.example.org.crt``
SECRET_KEY              The Django secret key. Generate a new key especially
                        if this is going to be a production deployment
DJANGO_SETTINGS_MODULE  Defaults to ``wagtail_project.settings.production``
HOST_NAME               This is will be set to  as the ``server_name``
                        in the nginx virtualhost.
DB_USER                 Defaults to django
DB_PASSWD               The database password you must set a value for this 
DB_HOST                 Defaults to ``localhost``
DB_NAME                 The name of the database used in production 
                        Defaults to cookiecutter.repo_name_db 
EMAIL_HOST              The SMTP email host name e.g. ``smtp.mandrillapp.com``
EMAIL_FROM              support@chrisdev.com
EMAIL_USER              The email user 
EMAIL_PASSWD            The email password 
======================  ====================================================

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

Playbooks
----------

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