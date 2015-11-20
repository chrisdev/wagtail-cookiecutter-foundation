# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='eventpage',
            name='audience',
            field=models.CharField(blank=True, max_length=255, null=True, choices=[(b'public', b'Public'), (b'private', b'Private')]),
        ),
        migrations.AlterField(
            model_name='eventpage',
            name='cost',
            field=models.CharField(max_length=255, null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='eventpage',
            name='location',
            field=models.CharField(max_length=255, null=True, blank=True),
        ),
    ]
