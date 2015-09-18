from django.contrib.sites.models import get_current_site
from urlparse import urljoin
def site_url(request):
    scheme = 'https' if request.is_secure() else 'http'
    site = get_current_site(request)
    #domain = "{}://{}".format(scheme, site.domain)

    return {
        'site_url':  "{}://{}".format(scheme, site.domain),
        'site_name': site.name
    }