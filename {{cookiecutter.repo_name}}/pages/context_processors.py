from django.contrib.sites.models import get_current_site

def site_url(request):
    scheme = 'https' if request.is_secure() else 'http'

    domain = ''.join([scheme, '://', get_current_site(request).domain])
    return { 'site_url': domain}