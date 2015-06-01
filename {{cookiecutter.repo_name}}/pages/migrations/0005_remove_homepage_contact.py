# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0004_homepage_contact'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='homepage',
            name='contact',
        ),
    ]
