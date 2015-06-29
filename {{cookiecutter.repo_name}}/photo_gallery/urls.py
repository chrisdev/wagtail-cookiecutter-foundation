from django.conf.urls import patterns, url

from . import views


urlpatterns = patterns('',
    url(r'^$', views.photo_gallery, name='photo-gallery'),
)