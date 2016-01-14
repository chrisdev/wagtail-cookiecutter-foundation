# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0005_auto_20151021_1630'),
    ]

    operations = [
        migrations.AddField(
            model_name='standardpage',
            name='template_string',
            field=models.CharField(default=b'pages/standard_page.html', max_length=255, choices=[(b'pages/standard_page.html', b'Default Template'), (b'pages/standard_page_full.html', b'Standard Page Full')]),
        ),
    ]
