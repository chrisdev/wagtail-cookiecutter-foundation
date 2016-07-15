# flake8: noqa
from __future__ import absolute_import

# This will make sure the celery app is always imported when
# Django starts so that tasks can use this celery app.
# Without this Django wouldn't know which celery app to use.
# See http://celery.readthedocs.org/en/latest/django/first-steps-with-django.html
from .celery import app as celery_app
