# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import modelcluster.contrib.taggit
import wagtail.core.fields
import modelcluster.fields
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('taggit', '0002_auto_20150616_2121'),
        ('wagtailcore', '0019_verbose_names_cleanup'),
        ('wagtailimages', '0008_image_created_at_index'),
    ]

    operations = [
        migrations.CreateModel(
            name='DocumentsIndexPage',
            fields=[
                ('page_ptr', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='wagtailcore.Page', auto_created=True, on_delete=models.SET_NULL,)),
                ('intro', wagtail.core.fields.RichTextField(blank=True)),
                ('feed_image', models.ForeignKey(on_delete=django.db.models.deletion.SET_NULL, blank=True, related_name='+', to='wagtailimages.Image', null=True)),
            ],
            options={
                'verbose_name': 'Documents Index Page',
            },
            bases=('wagtailcore.page',),
        ),
        migrations.CreateModel(
            name='DocumentsPage',
            fields=[
                ('page_ptr', models.OneToOneField(parent_link=True, primary_key=True, serialize=False, to='wagtailcore.Page', auto_created=True, on_delete=models.SET_NULL,)),
                ('feed_image', models.ForeignKey(on_delete=django.db.models.deletion.SET_NULL, blank=True, related_name='+', to='wagtailimages.Image', null=True)),
            ],
            options={
                'verbose_name': 'Documents Page',
            },
            bases=('wagtailcore.page',),
        ),
        migrations.CreateModel(
            name='DocumentsPageTag',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
                ('content_object', modelcluster.fields.ParentalKey(related_name='tagged_items', to='documents_gallery.DocumentsPage')),
                ('tag', models.ForeignKey(related_name='documents_gallery_documentspagetag_items', to='taggit.Tag', on_delete=models.SET_NULL,)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='documentspage',
            name='tags',
            field=modelcluster.contrib.taggit.ClusterTaggableManager(help_text='A comma-separated list of tags.', blank=True, verbose_name='Tags', to='taggit.Tag', through='documents_gallery.DocumentsPageTag'),
        ),
    ]
