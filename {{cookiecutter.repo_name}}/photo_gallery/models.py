from django.db import models
from django.db.models.signals import pre_delete
from django.dispatch import receiver

from wagtail.wagtailimages.models import Image, AbstractImage, AbstractRendition


class CustomImage(AbstractImage):

    gallery_name = models.CharField(max_length=255, blank=True, verbose_name=('Gallery_name') )

class CustomRendition(AbstractRendition):
    image = models.ForeignKey(CustomImage, related_name='renditions')

    class Meta:
        unique_together = (
            ('image', 'filter', 'focal_point_key'),
        )


@receiver(pre_delete, sender=CustomImage)
def image_delete(sender, instance, **kwargs):
    instance.file.delete(False)


@receiver(pre_delete, sender=CustomRendition)
def rendition_delete(sender, instance, **kwargs):
    instance.file.delete(False)