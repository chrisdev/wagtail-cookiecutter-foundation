# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='productindexpagerelatedlink',
            name='link_external',
            field=models.URLField(verbose_name='External link', blank=True),
        ),
        migrations.AlterField(
            model_name='productindexpagerelatedlink',
            name='title',
            field=models.CharField(help_text='Link title', max_length=255),
        ),
        migrations.AlterField(
            model_name='productpagerelatedlink',
            name='link_external',
            field=models.URLField(verbose_name='External link', blank=True),
        ),
        migrations.AlterField(
            model_name='productpagerelatedlink',
            name='title',
            field=models.CharField(help_text='Link title', max_length=255),
        ),
    ]
