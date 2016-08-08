# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0003_advert'),
    ]

    operations = [
        migrations.AlterField(
            model_name='advert',
            name='title',
            field=models.CharField(max_length=150, null=True),
        ),
    ]
