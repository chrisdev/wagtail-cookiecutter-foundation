# Importing the syndication feed
from django.contrib.syndication.views import Feed
from django.utils.feedgenerator import Rss201rev2Feed

from wagtail.wagtailimages.models import Filter
from wagtail.wagtailcore.models import Site
from django.utils.html import strip_tags
from django.conf import settings
from datetime import datetime, time

import importlib
blogmodel_path = importlib.import_module(getattr(settings, "FEEDS_BLOG_MODEL_PATH"))


class CustomFeedGenerator(Rss201rev2Feed):

    def root_attributes(self):
        attrs = super(CustomFeedGenerator, self).root_attributes()
        attrs['xmlns:content'] = 'http://purl.org/rss/1.0/modules/content/'
        return attrs

    def add_item_elements(self, handler, item):
        super(CustomFeedGenerator, self).add_item_elements(handler, item)
        handler.startElement(u"content:encoded", {})

        content = '<![CDATA['
        content += '<h3>%s</h3><hr>' % (item['content_description'])
        if item['image'] != "":
            content += '<img src="%s">' % (item['image'])
        content += ']]>'

        # Adding content in this way do not escape content so make it suitable for
        # Feedburner and other services. If we use handler.characters(content) then
        # it will escape content and will not work perfectly with Feedburner and 
        # other services.
        handler._write(content)

        handler.endElement(u"content:encoded")

class BlogFeed(Feed):

    # FEED TYPE
    feed_type = CustomFeedGenerator

    # The RSS information that gets shown at the top of the feed.
    title = getattr(settings, "FEEDS_TITLE", "")
    link = getattr(settings, "FEEDS_LINK", "")
    description = getattr(settings, "FEEDS_DESCRIPTION", "")
    
    author_email = getattr(settings, "FEEDS_AUTHOR_EMAIL", "")
    author_link = getattr(settings, "FEEDS_AUTHOR_LINK", "")

    def items(self):
        blog_model_name = getattr(settings, "FEEDS_BLOG_MODEL_NAME")
        return getattr(blogmodel_path, blog_model_name).objects.order_by('date')

    # This gets the model datefield "date" which shows when the blog post was made.
    def item_pubdate(self, item):
        return datetime.combine(item.date, time())

    def item_title(self, item):
        return item.title

    def item_description(self, item):
        intro_field = getattr(settings, "FEEDS_BLOG_DESCRIPTION_INTRO")
        body_field = getattr(settings, "FEEDS_BLOG_DESCRIPTION_BODY")
        
        if getattr(item, intro_field):
            return strip_tags(getattr(item, intro_field)) 
        else:
            return strip_tags(getattr(item, body_field))

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
            filter,_ = Filter.objects.get_or_create(spec='width-1200')
            img = feed_image.get_rendition(filter)

            site_objects = Site.objects.all()

            # Getting the Default site to be added in image relative URL
            for site in site_objects:
                if site.is_default_site:
                    default_site = site

            image_complete_url = default_site.root_url + img.url

        content_description = strip_tags(item.intro) if item.intro else strip_tags(item.body)

        return { 'image': image_complete_url if feed_image else "",
                'content_description': content_description
        }