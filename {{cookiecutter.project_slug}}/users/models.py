# -*- coding: utf-8 -*-
from __future__ import unicode_literals, absolute_import

from django.contrib.auth.models import AbstractUser
from django.urls import reverse
from django.db import models
from django.utils.encoding import python_2_unicode_compatible
from django.utils.translation import ugettext_lazy as _

from django_countries.fields import CountryField


@python_2_unicode_compatible
class User(AbstractUser):

    # First Name and Last Name do not cover name patterns
    # around the globe.
    name = models.CharField(_('Full name'), default='', max_length=255)
    address = models.TextField(_('Address'), default='')
    city = models.CharField(_('City or Town'), default='', max_length=255)
    state = models.CharField(_('State/Province'), default='', blank=True,
                             max_length=255)
    country_of_residence = CountryField(_('Country of Residence'),
                                        default='TT')
    country_of_nationality = CountryField(_('Country of Nationality'),
                                          default='TT')
    job = models.CharField(_('Job Title or Occupation'), default='',
                           max_length=255)
    organisation = models.CharField(_('Organisation'), default='',
                                    max_length=255)
    tos = models.BooleanField(_('I have read and agree with the terms ' +
                                'of Service'), default=True)

    def __str__(self):
        return self.username

    def get_absolute_url(self):
        return reverse('users:detail')
