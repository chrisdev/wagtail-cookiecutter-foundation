from django import template
from django.conf import settings
register = template.Library()


@register.assignment_tag
def get_ga_key():
    return getattr(settings, 'GOOGLE_ANALYTICS_KEY', "")


@register.assignment_tag
def get_googe_maps_key():
    return getattr(settings, 'GOOGLE_MAPS_KEY', "")


@register.assignment_tag
def get_facebook_appid():
    return getattr(settings, 'FACEBOOK_APPID', "")
