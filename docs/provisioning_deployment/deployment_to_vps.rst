Deploying to a VPS
==================

Create a Virtual Server
-----------------------

.. raw:: html

    <div>
       <iframe width="640" height="360" src="https://www.youtube.com/embed/nhJ7LOzBUjk?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
    </div>

Create a droplet at `Digital Ocean`_ selecting your size server, server name, server location and adding your ssh keys. Once you have create a droplet, deploying your site is really simple.

.. _Digital Ocean: https://www.digitalocean.com/

If you are using digital ocean run ::

    make pre_task 
    

Creating a Deployment User
--------------------------

.. raw:: html

    <div>
       <iframe width="640" height="360" src="https://www.youtube.com/embed/mSffkWuCkgQ?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
    </div>
    
Next we want to create a deployment user. To create the deploy user for the production ::

    make deploy_user
    
Next copy your ``id_rsa.pub`` to the ``ansible/{{cookiecutter.project_slug}}_keystore/`` folder and change the file name to ``authorized_keys``

In addition,  to creating the deploy user, this make command will download the RSA ``ssh`` public key for the deployment user into your ``ansible/{{cookiecutter.project_slug}}_keystore/`` directory. Add this key as a deployment key on sites like github.com or bitbucket.org


Provisioning your Server and Deploying your Site
------------------------------------------------
    
Now we want to populate your site with all the project's requirements ::

    make provision

=============================================
Populate .env With Your Environment Variables
=============================================

Some of these services rely on environment variables set by you. There is an env.example file in the root directory of this project as a starting point. Add your own variables to the file, then move it to the ``ansible/{{cookiecutter.project_slug}}_keystore/`` folder and change the file name to ``env.production``. After you have change the file name set the ``DJANGO_DEBUG`` to ``off``.