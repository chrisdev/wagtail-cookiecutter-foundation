# flake8: noqa
from .base import *
from os.path import abspath, dirname, join


DEBUG = env.bool('DJANGO_DEBUG', default=True)
TEMPLATES[0]['OPTIONS']['debug'] = DEBUG

INSTALLED_APPS += (
    'debug_toolbar',
    'django_extensions',
)

INTERNAL_IPS = ('127.0.0.1',)

# See: https://github.com/django-debug-toolbar/django-debug-toolbar#installation
MIDDLEWARE += (
    'debug_toolbar.middleware.DebugToolbarMiddleware',
)

SECRET_KEY = env('DJANGO_SECRET_KEY',
                 default='7nn(g(lb*8!r_+cc3m8bjxm#xu!q)6fidwgg&$p$6a+alm+x')

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

# Use Dummy cache for development
CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.dummy.DummyCache',
    }
}

# Process all tasks synchronously.
# Helpful for local development and running tests
CELERY_EAGER_PROPAGATES_EXCEPTIONS = True
CELERY_ALWAYS_EAGER = True


try:
    from .local import *
except ImportError:
    pass

