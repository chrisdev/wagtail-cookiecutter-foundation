Ansible Files
==============
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