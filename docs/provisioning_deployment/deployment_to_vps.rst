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

**Note**: If your repository is private. Make sure to add ``ssh`` key to the repository level deploy keys. You can add deploy keys to the repository from the repository's settings tab.

Provisioning your Server and Deploying your Site
------------------------------------------------
    
Now we want to populate your site with all the project's requirements ::

    make provision

You may also choose to run tasks using tag by making use of the ansible tags.

**Install and configure various Ubuntu packages** ::

    ansible-playbook -i ansible/production ansible/provision.yml --tags=packages 
    
**Add basic security (UFW and Fail2Ban)**::

    ansible-playbook -i ansible/production ansible/provision.yml --tags=secure

**Install and configure PostgreSQL, set up the project's database** ::

   ansible-playbook -i ansible/production ansible/provision.yml --tags=database 
  
**Install and Configure LetsEncrypyt and Nginx** ::

	ansible-playbook -i ansible/production ansible/provision.yml --tags=le
	ansible-playbook -i ansible/production ansible/provision.yml --tags=nginx

**Configure the Production enviroment** ::

	ansible-playbook -i ansible/production ansible/provision.yml --tags=vcs_repo

	cp env.example ansible/wagtail_project_keystore/env.production
	ansible-playbook -i ansible/production ansible/provision.yml --tags=venv

**Install and configure bower and redis** ::

	ansible-playbook -i ansible/production ansible/provision.yml --tags=bower
	ansible-playbook -i ansible/production ansible/provision.yml --tags=redis
    
**Setup and configure the django project** ::

	ansible-playbook -i ansible/production ansible/provision.yml --tags=django
	ansible-playbook -i ansible/production ansible/provision.yml --tags=initial_data
	ansible-playbook -i ansible/production ansible/provision.yml --tags=gunicorn
	ansible-playbook -i ansible/production ansible/provision.yml --tags=celery
    
**Baisc House keeping Tasks** ::

	ansible-playbook -i ansible/production ansible/provision.yml --tags=clean_up

Once your site is up and running. You can push the changes to the live site using ::

	make deploy

=============================================
Populate .env With Your Environment Variables
=============================================

Some of these services rely on environment variables set by you. There is an env.example file in the root directory of this project as a starting point. Add your own variables to the file, then move it to the ``ansible/{{cookiecutter.project_slug}}_keystore/`` folder and change the file name to ``env.production``. After you have change the file name set the ``DJANGO_DEBUG`` to ``off``.
