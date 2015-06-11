# Importing the syndication feed and BlogPage class from blog model.
from django.contrib.syndication.views import Feed
from django.utils.feedgenerator import Rss201rev2Feed
from datetime import datetime, time
from blog.models import BlogPage

class CustomFeedGenerator(Rss201rev2Feed):

    def root_attributes(self):
        attrs = super(CustomFeedGenerator, self).root_attributes()
        attrs['xmlns:content'] = 'http://purl.org/rss/1.0/modules/content/'
        return attrs

    def add_item_elements(self, handler, item):
        super(CustomFeedGenerator, self).add_item_elements(handler, item)
        handler.addQuickElement(u"image", item['image'])
        handler.addQuickElement(u"body", item['body'])

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
        return { 'image': '%s' % (item.feed_image) if item.feed_image else "",
                 'body' : item.body,}