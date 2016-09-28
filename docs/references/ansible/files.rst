Ansible Keystore
=================

In our project layout,  the ``keystore`` folder located at ``ansible/cookiecutter.project_slug.keystore`` is utilized for storing authorized keys, deployment key and the production environment settings.   The  various provisioning and deployment playbooks expect these files to be in the keystore directory and would fail if they were not present.  In case you are  wondering, the included ``.gitignore`` and ``.hgignore`` should ensure that that no file in this directory can accidentally be added to your VCS. However, it is important to verify that this is indeed the case. The files are as follows: 

 - *Authorized Keys (authorized_keys)* - public key of the developers for e.g. ``id_rsa.pub``. You can
   concatenate keys for one or more developers and name as ``authorized_keys``
 - *Deployment Key ( host_name-deploy_user-deploy_keys.pub)* -  This is the Public key of the Deployment user generated running the command ``make  deploy``
 - *Production  Environment Settings (production.env)* -  The Django production enviroment settings used in the project.
 
