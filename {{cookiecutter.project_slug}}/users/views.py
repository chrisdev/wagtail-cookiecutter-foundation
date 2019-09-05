from __future__ import absolute_import, unicode_literals

from django.urls import reverse
from django.views.generic import DetailView, ListView, RedirectView, UpdateView
from django.shortcuts import get_object_or_404

from braces.views import LoginRequiredMixin, StaffuserRequiredMixin
from .models import User


class UserDetailView(LoginRequiredMixin, DetailView):
    model = User

    def get_context_data(self, **kwargs):
        context = super(UserDetailView, self).get_context_data(**kwargs)
        return context

    def get_object(self):
        return get_object_or_404(User, pk=self.request.user.id)


class UserRedirectView(LoginRequiredMixin, RedirectView):
    permanent = False

    def get_redirect_url(self):
        return reverse('users:detail')


class UserUpdateView(LoginRequiredMixin, UpdateView):

    fields = ['name', 'job', 'organisation', 'address', 'city',
              'state', 'country_of_residence', 'country_of_nationality']

    # we already imported User in the view code above, remember?
    model = User

    # send the user back to their own page after a successful update
    def get_success_url(self):
        return reverse('users:detail')

    def get_object(self):
        # Only get the User record for the user making the request
        return User.objects.get(username=self.request.user.username)


class UserListView(StaffuserRequiredMixin, LoginRequiredMixin, ListView):
    model = User
