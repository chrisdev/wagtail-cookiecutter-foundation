from __future__ import unicode_literals, absolute_import

from django.contrib.auth.models import AbstractUser
from django.urls import reverse
from django.db import models
from six import python_2_unicode_compatible
from django.utils.translation import ugettext_lazy as _

@python_2_unicode_compatible
class User(AbstractUser):

    # First Name and Last Name do not cover name patterns
    # around the globe.
    name = models.CharField(_('Full Name'), default='', max_length=255)
    address = models.CharField(_('Address'), max_length=255)
    city = models.CharField(_('City or Town'), default='', max_length=255)
    state = models.CharField(_('State/Province'), default='', blank=True, max_length=255)
    country = models.CharField(_('Country'), default='', max_length=255)
    job = models.CharField(_('Job Title or Occupation'), default='', blank=True, max_length=255)
    organisation = models.CharField(_('Organisation'), default='', blank=True, max_length=255)
    tos = models.BooleanField(_('I have read and agree with the terms ' + 'of Service'), default=True)

    def __str__(self):
        if self.name:
            return self.name
        else:
            return self.username

    def get_absolute_url(self):
        return reverse('users:detail')
