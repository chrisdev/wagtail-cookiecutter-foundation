# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailimages', '0006_add_verbose_names'),
        ('wagtaildocs', '0003_add_verbose_names'),
        ('wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field'),
        ('pages', '0002_create_homepage'),
    ]

    operations = [
        migrations.CreateModel(
            name='Advert',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('link_external', models.URLField(verbose_name=b'External link', blank=True)),
                ('title', models.CharField(max_length=150, null=True, blank=True)),
                ('text', wagtail.wagtailcore.fields.RichTextField(blank=True)),
                ('image', models.ForeignKey(on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailimages.Image', null=True)),
                ('link_document', models.ForeignKey(related_name='+', blank=True, to='wagtaildocs.Document', null=True)),
                ('link_page', models.ForeignKey(related_name='+', blank=True, to='wagtailcore.Page', null=True)),
                ('page', models.ForeignKey(related_name='adverts', blank=True, to='wagtailcore.Page', null=True)),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
