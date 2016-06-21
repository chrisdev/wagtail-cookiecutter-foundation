from django.db import models

from wagtail.contrib.settings.models import BaseSetting, register_setting

# Create your models here.


@register_setting
class FeedsAppSettings(BaseSetting):
    feed_app_label = models.CharField(
        max_length=255, help_text='blog App whose Feed is to be generated',
        null=True, blank=True)
    feed_model_name = models.CharField(
        max_length=255, help_text='Model to be used for feed generation',
        null=True, blank=True)
    feed_title = models.CharField(
        max_length=255, help_text='Title of Feed', null=True, blank=True)
    feed_link = models.URLField(
        max_length=255, help_text='link for Feed', null=True, blank=True)
    feed_description = models.CharField(
        max_length=255, help_text='Description of field', null=True,
        blank=True)
    feed_author_email = models.EmailField(
        max_length=255, help_text='Email of author', null=True, blank=True)
    feed_author_link = models.URLField(
        max_length=255, help_text='Link of author', null=True, blank=True)

    feed_item_description_field = models.CharField(
        max_length=255, help_text='Description field for feed item',
        null=True, blank=True)
    feed_item_content_field = models.CharField(
        max_length=255, help_text='Content Field for feed item',
        null=True, blank=True)
