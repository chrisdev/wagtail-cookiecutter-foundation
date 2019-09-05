from __future__ import absolute_import, unicode_literals

from django.conf.urls import url

from . import views

app_name = "users"

urlpatterns = [
    url(
        regex=r'^list/$',
        view=views.UserListView.as_view(),
        name='list'
    ),
    url(
        regex=r'^redirect/$',
        view=views.UserRedirectView.as_view(),
        name='redirect'
    ),
    url(
        regex=r'^dashboard/$',
        view=views.UserDetailView.as_view(),
        name='detail'
    ),
    url(
        regex=r'^update/$',
        view=views.UserUpdateView.as_view(),
        name='update'
    ),
]
