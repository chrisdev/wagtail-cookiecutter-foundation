from django.conf import settings
from django.urls import path

from .views import index

ADMIN_ROOT = template = getattr(settings, 'GALLERY_ADMIN_URL_ROOT', 'admin')

urlpatterns = [
    path('{}/images/'.format(ADMIN_ROOT), index, name='index'),
]
