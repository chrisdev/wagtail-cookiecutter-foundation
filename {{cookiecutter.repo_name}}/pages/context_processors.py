from django.contrib.sites.models import get_current_site

def site_url(request):
    domain = ''.join(['http://', get_current_site(request).domain])
    return { 'site_url': domain}