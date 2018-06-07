# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2018-05-01 13:41
from __future__ import unicode_literals

from django.db import migrations, models
import wagtail.core.blocks
import wagtail.core.fields
import wagtail.images.blocks
import wagtailmarkdown.blocks


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0019_auto_20171102_1856'),
    ]

    operations = [
        migrations.AlterField(
            model_name='standardindexpage',
            name='template_string',
            field=models.CharField(choices=[('pages/standard_index_page.html', 'Default Template'), ('pages/standard_index_page_grid.html', 'Grid Also In This Section')], default='pages/standard_index_page.html', max_length=255),
        ),
        migrations.AlterField(
            model_name='standardpage',
            name='body',
            field=wagtail.core.fields.StreamField((('paragraph', wagtail.core.blocks.RichTextBlock()), ('image', wagtail.images.blocks.ImageChooserBlock()), ('markdown', wagtailmarkdown.blocks.MarkdownBlock(icon='code')), ('html', wagtail.core.blocks.RawHTMLBlock()))),
        ),
        migrations.AlterField(
            model_name='videogallerypagecarouselitem',
            name='embed_url',
            field=models.URLField(blank=True, verbose_name='Embed URL'),
        ),
        migrations.AlterField(
            model_name='videogallerypagecarouselitem',
            name='link_external',
            field=models.URLField(blank=True, verbose_name='External link'),
        ),
    ]
