"""
Does the following:
1. Generates and saves random secret keys for django and database access in
env.example
ansible/host_vars/{{production_hostname}}
A portion of this code was adopted from Django's standard crypto functions and
utilities, specifically:
    https://github.com/django/django/blob/master/django/utils/crypto.py
"""
from __future__ import print_function
import os
import random
# import shutil
# from cookiecutter.main import cookiecutter

# Get the root project directory
PROJECT_DIRECTORY = os.path.realpath(os.path.curdir)
# Use the system PRNG if possible
try:
    random = random.SystemRandom()
    using_sysrandom = True
except NotImplementedError:
    using_sysrandom = False


def get_random_string(
        length=50,
        allowed_chars='abcdefghijklmnopqrstuvwxyz0123456789!@%^&*(-_=+)'):
    """
    Returns a securely generated random string.
    The default length of 12 with the a-z, A-Z, 0-9 character set returns
    a 71-bit value. log_2((26+26+10)^12) =~ 71 bits
    """
    if using_sysrandom:
        return ''.join(random.choice(allowed_chars) for i in range(length))
    print(
        "Couldn't find a secure pseudo-random number generator on your system."
        "Please change change your SECRET_KEY variables in"
        "env.example ansible/host_vars"
        "manually."
    )
    return "CHANGEME!!"


def set_secret_key(file_location):
    # Open locals.py
    with open(file_location) as f:
        file_ = f.read()

    # Generate a SECRET_KEY that matches the Django standard
    SECRET_KEY = get_random_string()

    # Replace "CHANGEME!!!" with SECRET_KEY
    file_ = file_.replace('change_django_secret_key!!!', SECRET_KEY, 1)

    # Write the results to the locals.py module
    with open(file_location, 'w') as f:
        f.write(file_)


def set_django_admin_user_password(file_location, secret_key):
    with open(file_location) as f:
        file_ = f.read()

    file_ = file_.replace('change_django_admin_password!!!', secret_key, 1)

    with open(file_location, 'w') as f:
        f.write(file_)


def set_db_password(file_location, secret_key):
    with open(file_location) as f:
        file_ = f.read()

    file_ = file_.replace('change_db_password!!!', secret_key, 1)

    with open(file_location, 'w') as f:
        f.write(file_)


def make_secret_key(project_directory):
    """Generates and saves random secret key"""
    # Determine the local_setting_file_location
    env_file = os.path.join(
        project_directory,
        'env.example'
    )

    # env.example file
    set_secret_key(env_file)


def make_db_password(project_directory):
    """Generates and saves a random password for the db user"""
    SECRET_KEY = get_random_string(length=12)

    env_file = os.path.join(
        project_directory,
        'env.example'
    )

    # env.example file
    set_db_password(env_file, SECRET_KEY)

    # import pdb; pdb.set_trace() ### BREAK-POINT
    host_vars_file = os.path.join(
        project_directory,
        'ansible', 'host_vars', '{{ cookiecutter.production_host_name }}'
    )

    # set it in host_vars file
    set_db_password(host_vars_file, SECRET_KEY)


def make_django_admin_user_password(project_directory):
    # import pdb; pdb.set_trace() ### BREAK-POINT

    SECRET_KEY = get_random_string(length=12)

    host_vars_file = os.path.join(
        project_directory,
        'ansible', 'host_vars', '{{ cookiecutter.production_host_name }}'
    )
    set_django_admin_user_password(host_vars_file, SECRET_KEY)


def remove_file(file_name):
    if os.path.exists(file_name):
        os.remove(file_name)


make_secret_key(PROJECT_DIRECTORY)
make_db_password(PROJECT_DIRECTORY)
make_django_admin_user_password(PROJECT_DIRECTORY)
