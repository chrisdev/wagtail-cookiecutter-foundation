Deployment
===========

Creating a Droplet
------------------

Create a droplet at https://www.digitalocean.com/ selecting your size server, server name, server location and adding your ssh keys. Once you have create a droplet, deploying your site is really simple.

If you are using digital ocean run ::

    make pre_task 
    

Creating a Deployment User
--------------------------
    
Next we want to create a deployment user. To create the deploy user for the production ::

    make deploy_user
    
Next copy your ``id_rsa.pub`` to the ``ansible/{{cookiecutter.project_slug}}_keystore/`` folder and change the file name to ``authorized_keys``

In addition,  to creating the deploy user, this make command will download the RSA ``ssh`` public key for the deployment user into your ``ansible/{{cookiecutter.project_slug}}_keystore/`` directory. Add this key as a deployment key on sites like github.com or bitbucket.org