Ansible Variables
=================

Group Variables
----------------

===============     ====================================================
Variable            Default
===============     ====================================================
project_repo        ssh://hg@bitbucket.org/username/wagtail_project
project_title       Wagtail Project
project_name        Wagtail Project
virtualenvs_dir     /home/django/virtualenvs/
sites_dir           /usr/local/sites
nginx_root_dir      /etc/nginx/sites-available
gunicorn            127.0.0.1:2015
deploy_user         django
keystore_path       project_slug/ansible/project_slug_keystore 
vcs                 *hg* - mecurial 
                    *git* - git
===============     ====================================================

Host Variables
----------------

======================  ====================================================
Variable                Default
======================  ====================================================
use_ssl                 True
SECRET_KEY              The Django secret key. Generate a new key especially
                        if this is going to be a production deployment
DJANGO_SETTINGS_MODULE  wagtail_project.settings.production
HOST_NAME               ``server_name``
DB_USER                 django
DJANGO_ADMIN:           django_admim_user_name 
DJANGO_ADMIN:           your_django_admin_password
DB_PASSWD               The database password you must set a value for this 
DB_HOST                 localhost
DB_NAME                 cookiecutter.project_slug_db 
EMAIL_HOST              The SMTP email host name e.g. ``smtp.mandrillapp.com``
EMAIL_FROM              support@chrisdev.com
EMAIL_USER              The email user 
EMAIL_PASSWD            The email password 
======================  ====================================================