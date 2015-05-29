# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0003_homepage_title_text'),
    ]

    operations = [
        migrations.AddField(
            model_name='homepage',
            name='contact',
            field=wagtail.wagtailcore.fields.RichTextField(null=True, blank=True),
            preserve_default=True,
        ),
    ]
