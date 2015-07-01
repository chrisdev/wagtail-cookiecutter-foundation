# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('photo_gallery', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='customimage',
            name='tags',
        ),
        migrations.RemoveField(
            model_name='customimage',
            name='uploaded_by_user',
        ),
        migrations.AlterUniqueTogether(
            name='customrendition',
            unique_together=None,
        ),
        migrations.RemoveField(
            model_name='customrendition',
            name='filter',
        ),
        migrations.RemoveField(
            model_name='customrendition',
            name='image',
        ),
        migrations.DeleteModel(
            name='CustomImage',
        ),
        migrations.DeleteModel(
            name='CustomRendition',
        ),
    ]
