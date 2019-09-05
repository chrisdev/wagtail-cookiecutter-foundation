# flake8: noqa
from django.conf.urls import include, url
from django.conf.urls.static import static
from django.conf import settings
from django.contrib import admin

from wagtail.admin import urls as wagtailadmin_urls
from wagtail.documents import urls as wagtaildocs_urls
from wagtail.core import urls as wagtail_urls
from wagtail.images.views.serve import ServeView
from wagtail.contrib.sitemaps.views import sitemap

from search import views as search_views

from wagtail_feeds.feeds import (
    BasicFeed, BasicJsonFeed, ExtendedFeed, ExtendedJsonFeed
)

admin.autodiscover()


urlpatterns = [
    url(r'^django-admin/', (admin.site.urls)),
    url(r'^users/', include('users.urls')),
    url(r'^accounts/', include('allauth.urls')),
    url(r'^admin/', include(wagtailadmin_urls)),
    url(r'^search/$', search_views.search, name='search'),
    url(r'^documents/', include(wagtaildocs_urls)),

    url('^sitemap.xml$', sitemap),
    url(r'^blog/feed/basic$', BasicFeed(), name='basic_feed'),
    url(r'^blog/feed/extended$', ExtendedFeed(), name='extended_feed'),

    # JSON feed
    url(r'^blog/feed/basic.json$', BasicJsonFeed(), name='basic_json_feed'),
    url(r'^blog/feed/extended.json$', ExtendedJsonFeed(), name='extended_json_feed'),

    url(
        r'^images/([^/]*)/(\d*)/([^/]*)/[^/]*$',
        ServeView.as_view(), name='wagtailimages_serve'
    ),
    # For anything not caught by a more specific rule above, hand over to
    # Wagtail's serving mechanism
    url(r'', include(wagtail_urls)),
]


if settings.DEBUG:
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns
    from django.views.generic.base import RedirectView

    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
    urlpatterns += [
        url(r'^favicon\.ico$',
            RedirectView.as_view(
                url=settings.STATIC_URL + 'favicon.ico', permanent=True)
            ),
    ]

    if 'debug_toolbar' in settings.INSTALLED_APPS:
        import debug_toolbar

        urlpatterns = [
            url(r'^__debug__/', include(debug_toolbar.urls)),
        ] + urlpatterns
