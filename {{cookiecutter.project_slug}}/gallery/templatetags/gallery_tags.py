import os
import re

from django.conf import settings
from django import template

from gallery.models import get_gallery_images

register = template.Library()


@register.inclusion_tag('gallery/gallery.html')
def gallery(collection=None, tags=None, image_limit=None):
    if not collection:
        return
    images = None
    try:
        images = get_gallery_images(collection, tags=tags.split() if tags else None)
        if image_limit:
            images = images[:int(image_limit)]
    except Exception:
        pass
    return {'gallery_images': images}


@register.filter
def original_url(image):
    return os.path.join(settings.MEDIA_URL, str(image.file))


@register.filter
def hide_num_order(title):
    number_match = re.match(r'^.*?\[[^\d]*(\d+)[^\d]*\].*$', title)
    if number_match:
        number = number_match.group(1)
        return title.replace('[{}]'.format(number), '')
    return title
