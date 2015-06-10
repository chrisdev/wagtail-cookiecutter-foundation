# Importing the syndication feed and BlogPage class from blog model.
from django.contrib.syndication.views import Feed
from django.utils import feedgenerator
from datetime import datetime, time
from blog.models import BlogPage

class BlogFeed(Feed):

    # FEED TYPE
    feed_type = feedgenerator.Rss201rev2Feed

    # The default RSS information that gets shown at the top of the feed.
    title = "Example site news"
    link = "/news/"
    description = "Updates on news in example site"
    
    author_email = 'example@example.com'
    author_link = 'http://example.com'

    # Link to custom templates for the blog title and blog description.
    title_template = 'blog_title.html'
    description_template = 'blog_description.html'

    def items(self):
        return BlogPage.objects.order_by('date')

    # This gets the BlogPage model datefield "date" which shows when the blog post was made.
    def item_pubdate(self, item):
        return datetime.combine(item.date, time())

    def item_link(self, item):
        return item.full_url

    def item_author_name(self, item):
        pass