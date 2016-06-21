# Importing the syndication feed
from django.contrib.syndication.views import Feed
from django.utils.feedgenerator import Rss201rev2Feed
from wagtail.wagtailimages.models import Filter
from wagtail.wagtailcore.models import Site
from datetime import datetime, time
from django.utils.html import strip_tags
from django.apps import apps
from wagtail.wagtailcore.rich_text import expand_db_html
from bs4 import BeautifulSoup
try:
    from urlparse import urljoin
except ImportError:
    from urllib.parse import urljoin
from django.utils import feedgenerator

from .models import FeedsAppSettings

feed_app_settings = FeedsAppSettings.for_site(
    site=Site.objects.get(is_default_site=True))
feed_app_label = feed_app_settings.feed_app_label
feed_model_name = feed_app_settings.feed_model_name
try:
    feed_model = apps.get_model(app_label=feed_app_label,
                                model_name=feed_model_name)
except:
    feed_model = None


class CustomFeedGenerator(Rss201rev2Feed):

    def root_attributes(self):
        attrs = super(CustomFeedGenerator, self).root_attributes()
        attrs['xmlns:content'] = 'http://purl.org/rss/1.0/modules/content/'
        return attrs

    def add_item_elements(self, handler, item):
        super(CustomFeedGenerator, self).add_item_elements(handler, item)
        handler.startElement(u"content:encoded", {})

        content = '<![CDATA['
        if item['image'] != "":
            content += '<img src="%s"><hr>' % (item['image'])
        content += item['content']
        content += ']]>'

        # Adding content in this way do not escape content so make it suitable
        # for Feedburner and other services. If we use
        # handler.characters(content) then it will escape content and will not
        # work perfectly with Feedburner and other services.
        handler._write(content)

        handler.endElement(u"content:encoded")


class BasicFeed(Feed):

    # FEED TYPE
    feed_type = feedgenerator.Rss201rev2Feed

    # The RSS information that gets shown at the top of the feed.
    title = feed_app_settings.feed_title
    link = feed_app_settings.feed_link
    description = feed_app_settings.feed_description

    author_email = feed_app_settings.feed_author_email
    author_link = feed_app_settings.feed_author_link

    item_description_field = feed_app_settings.feed_item_description_field
    item_content_field = feed_app_settings.feed_item_content_field

    def items(self):
        return feed_model.objects.order_by('-date').live()

    def item_pubdate(self, item):
        return datetime.combine(item.date, time())

    def item_link(self, item):
        return item.full_url

    def item_author_name(self, item):
        pass


class ExtendedFeed(Feed):

    # FEED TYPE
    feed_type = CustomFeedGenerator

    # The RSS information that gets shown at the top of the feed.
    title = feed_app_settings.feed_title
    link = feed_app_settings.feed_link
    description = feed_app_settings.feed_description

    author_email = feed_app_settings.feed_author_email
    author_link = feed_app_settings.feed_author_link

    item_description_field = feed_app_settings.feed_item_description_field
    item_content_field = feed_app_settings.feed_item_content_field

    def get_site_url(self):
        site = Site.objects.get(is_default_site=True)
        return site.root_url

    def items(self):
        return feed_model.objects.order_by('-date').live()

    def item_pubdate(self, item):
        return datetime.combine(item.date, time())

    def item_title(self, item):
        return item.title

    def item_description(self, item):
        content = strip_tags(getattr(item, self.item_description_field))
        return content

    def item_link(self, item):
        return item.full_url

    def item_author_name(self, item):
        pass

    def item_extra_kwargs(self, item):
        """
        Returns an extra keyword arguments dictionary that is used with
        the 'add_item' call of the feed generator.
        Add the fields of the item, to be used by the custom feed generator.
        """
        feed_image = item.feed_image
        if feed_image:
            filter, _ = Filter.objects.get_or_create(spec='width-1200')
            img = feed_image.get_rendition(filter)

            image_complete_url = urljoin(self.get_site_url(), img.url)

        content = expand_db_html(getattr(item, self.item_content_field))
        soup = BeautifulSoup(content, 'html.parser')
        for img_tag in soup.findAll('img'):
            img_tag['src'] = urljoin(self.get_site_url(), img_tag['src'])

        return {
            'image': image_complete_url if feed_image else "",
            'content': soup.prettify(formatter="html")
        }
