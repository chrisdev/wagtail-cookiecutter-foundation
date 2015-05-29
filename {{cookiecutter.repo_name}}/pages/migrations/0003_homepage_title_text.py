# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0002_create_homepage'),
    ]

    operations = [
        migrations.AddField(
            model_name='homepage',
            name='title_text',
            field=wagtail.wagtailcore.fields.RichTextField(null=True, blank=True),
            preserve_default=True,
        ),
    ]
