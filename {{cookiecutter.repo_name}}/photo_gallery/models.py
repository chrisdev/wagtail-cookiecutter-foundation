from django.db import models
from django.db.models.signals import pre_delete
from django.dispatch import receiver

from wagtail.wagtailimages.models import Image, AbstractImage, AbstractRendition


