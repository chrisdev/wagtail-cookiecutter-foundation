from fabric.api import *
from fabric.colors import *

env.roledefs = {
    'production': [],
    'staging': [],
}


@task
def install():

    local('createdb {{ cookiecutter.repo_name }}')
    local('python manage.py migrate')
    local('python manage.py load_initial_data')

    with settings(warn_only=True):
        bower = local('bower install')
        if bower.failed:
            print(red("Problem running bower, did you install Bower, node?"))


@roles('production')
def deploy_production():
    # Remove this line when you're happy that this task is correct
    raise RuntimeError("Please check the fabfile before using it")

    run('git pull origin master')
    run('pip install -r requirements.txt')
    run('django-admin migrate --noinput')
    run('django-admin collectstatic --noinput')
    run('django-admin compress')
    run('django-admin update_index')

    # 'restart' should be an alias to a script that restarts the web server
    run('restart')


@roles('staging')
def deploy_staging():
    # Remove this line when you're happy that this task is correct
    raise RuntimeError("Please check the fabfile before using it")

    run('git pull origin staging')
    run('pip install -r requirements.txt')
    run('django-admin migrate --noinput')
    run('django-admin collectstatic --noinput')
    run('django-admin compress')
    run('django-admin update_index')

    # 'restart' should be an alias to a script that restarts the web server
    run('restart')
