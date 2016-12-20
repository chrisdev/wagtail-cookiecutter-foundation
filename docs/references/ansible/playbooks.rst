Ansible Playbooks
=================

To provision you servers run

.. code-block:: sh

   cd ansible
   #list the available tags 
   ansible-playbook -i staging provision.yml --list-tags 

   #Run all the plays 

   ansible-playbook -i staging provision.yml 
   
   #Install and configure various Ubuntu packages
   
   ansible-playbook -i ansible/production ansible/provision.yml --tags packages 
       
   #Add basic security (UFW and Fail2Ban)
   
   ansible-playbook -i ansible/production ansible/provision.yml --tags secure
   
   #Install and configure PostgreSQL, set up the project's database
   
   ansible-playbook -i ansible/production ansible/provision.yml --tags database 
     
   #Install and Configure LetsEncrypyt and Nginx
   
   ansible-playbook -i ansible/production ansible/provision.yml --tags nginx_le	
   
   #Install VCS, Venv, Bower, Redis, Django, Load Initial Data, Gunicorn Celery
   
   ansible-playbook -i ansible/production ansible/provision.yml --tags webapp
   	

To deploy changes to production 

.. code-block:: sh

   make deploy
   

To make changes to your project settings edit env.production and also settings/production. Then run: 

.. code-block:: sh   
   
   ansible-playbook -i ansible/production ansible/update_env.yml