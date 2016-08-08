Ansible Variables
=================

Group Variables
----------------

===============     ====================================================
Variable            Explanation
===============     ====================================================
project_repo        URL of the source code repository
                    ssh://hg@bitbucket.org/chrisdev/wagtail_project
virtualenvs_dir     Defaults to /home/django/virtualenvs/
sites_dir           Where all your project's live on the 
                    remote server. Defaults to /usr/local/sites
nginx_root_dir      Defaults to /etc/nginx/sites-available
gunicorn            127.0.0.1:2015
deploy_user         Defaults to django
redis_version       The version of redis to install. Defaults to 2.8.19
keystore_path       Place all your 
                    public keys and other secrets here. 
                    Defaults to project_slug/ansible/project_slug_keystore 
vcs                 Your Version control system of choice 
                    *hg* - mecurial 
                    *git* - git
===============     ====================================================

Host Variables
----------------

======================  ====================================================
Variable                Explanation
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
DJANGO_ADMIN:           django_admim_user_name 
DJANGO_ADMIN:           your_django_admin_password
DB_PASSWD               The database password you must set a value for this 
DB_HOST                 Defaults to ``localhost``
DB_NAME                 The name of the database used in production 
                        Defaults to cookiecutter.project_slug_db 
EMAIL_HOST              The SMTP email host name e.g. ``smtp.mandrillapp.com``
EMAIL_FROM              support@chrisdev.com
EMAIL_USER              The email user 
EMAIL_PASSWD            The email password 
======================  ====================================================