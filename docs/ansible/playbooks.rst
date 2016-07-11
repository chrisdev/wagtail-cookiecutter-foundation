Ansible Playbooks
=================

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