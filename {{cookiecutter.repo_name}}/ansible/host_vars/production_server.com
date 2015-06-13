{% raw %}---
use_ssl:true 
django_env:
    SECRET_KEY: your_secret_key 
    DJANGO_SETTINGS_MODULE: {{cookiecutter.repo_name}}.settings.production
    HOST_NAME: {{cookiecutter.production_host_name}}
    DB_USER: django
    DB_PASSWD: your_db_password 
    DB_HOST: localhost
    DB_NAME: {{cookiecutter.repo_name}}_db 
    EMAIL_FROM: 'support@chrisdev.com'
    EMAIL_USER: 'email_user'
    EMAIL_PASSWD: 'email_passwd'
    GOOGLE_TRACKING_ID: 'google_tracking_id' {% endraw %}
