# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('contact', '0003_contactpage_name_organization'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='contactpage',
            name='contact_us',
        ),
    ]
