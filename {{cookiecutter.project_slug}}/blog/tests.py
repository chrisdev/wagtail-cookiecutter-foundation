from wagtail.tests.utils import WagtailPageTests

from pages.models import HomePage
from .models import BlogIndexPage, BlogPage


class BlogPageTests(WagtailPageTests):
    def test_can_create_under_blog_index_page(self):
        # You can create a BlogPage under BlogIndexPage
        self.assertCanCreateAt(BlogIndexPage, BlogPage)

    def test_cant_create_under_home_page(self):
        # You can not create a BlogPage under HomePage
        self.assertCanNotCreateAt(HomePage, BlogPage)
