from django import template
from django.conf import settings
register = template.Library()


@register.assignment_tag
def get_ga_key():
    return getattr(settings, 'GOOGLE_ANALYTICS_KEY', "")

@register.assignment_tag
def get_fb_sitename():
    return getattr(settings, 'FB_SITE_NAME', "")

@register.assignment_tag
def get_fb_url():
    return getattr(settings, 'FB_URL', "")

@register.assignment_tag
def get_fb_description():
    return getattr(settings, 'FB_DESCRIPTION', "")

@register.assignment_tag
def get_fb_appid():
    return getattr(settings, 'FB_APP_ID', "")

@register.assignment_tag
def get_twitter_url():
    return getattr(settings, 'TWITTER_URL', "")

@register.assignment_tag
def get_twitter_creator():
    return getattr(settings, 'TWITTER_CREATOR', "")

@register.assignment_tag
def get_twitter_description():
    return getattr(settings, 'TWITTER_DESCRIPTION', "")


@register.assignment_tag
def get_google_maps_key():
    return getattr(settings, 'GOOGLE_MAPS_KEY', "")

@register.assignment_tag
def get_dynamic_map_url():
    return getattr(settings, 'DYNAMIC_MAP_URL', "")

@register.assignment_tag
def get_static_map_url():
    return getattr(settings, 'STATIC_MAP_URL', "")
    
@register.assignment_tag
def get_facebook_appid():
    return getattr(settings, 'FACEBOOK_APPID', "")
