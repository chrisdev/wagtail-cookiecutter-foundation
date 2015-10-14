# Importing the syndication feed and BlogPage class from blog model.
from django.contrib.syndication.views import Feed
from django.utils.feedgenerator import Rss201rev2Feed
from wagtail.wagtailimages.models import Filter
from wagtail.wagtailcore.models import Site
from xml.sax.saxutils import escape
from datetime import datetime, time
from blog.models import BlogPage

class CustomFeedGenerator(Rss201rev2Feed):

    def root_attributes(self):
        attrs = super(CustomFeedGenerator, self).root_attributes()
        attrs['xmlns:content'] = 'http://purl.org/rss/1.0/modules/content/'
        return attrs

    def add_item_elements(self, handler, item):
        super(CustomFeedGenerator, self).add_item_elements(handler, item)
        handler.startElement(u"content:encoded", {})

        figure = '<figure type="image">'
        figure += '<image src="%s"></image>' % (item['image'])
        figure += '</image></figure>'

        handler.characters(escape(figure))

        handler.endElement(u"content:encoded")

class BlogFeed(Feed):

    # FEED TYPE
    feed_type = CustomFeedGenerator

    # The default RSS information that gets shown at the top of the feed.
    title = "Example site news"
    link = "/news/"
    description = "Updates on news in example site"
    
    author_email = 'example@example.com'
    author_link = 'http://example.com'

    def items(self):
        return BlogPage.objects.order_by('date')

    # This gets the BlogPage model datefield "date" which shows when the blog post was made.
    def item_pubdate(self, item):
        return datetime.combine(item.date, time())

    def item_title(self, item):
        return item.title

    def item_description(self, item):
        return item.intro if item.intro else item.body

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

            for site in site_objects:
                if site.is_default_site:
                    default_site = site

        return { 'image': default_site.root_url + img.url if feed_image else ""}