from django import template
from django.conf import settings
register = template.Library()


@register.simple_tag
def get_ga_key():
    return getattr(settings, 'GOOGLE_ANALYTICS_KEY', "")


@register.simple_tag
def get_google_maps_key():
    return getattr(settings, 'GOOGLE_MAPS_KEY', "")


@register.simple_tag
def get_dynamic_map_url():
    return getattr(settings, 'DYNAMIC_MAP_URL', "")


@register.simple_tag
def get_static_map_url():
    return getattr(settings, 'STATIC_MAP_URL', "")
