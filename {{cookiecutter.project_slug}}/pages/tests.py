from wagtail.tests.utils import WagtailPageTests

from .models import HomePage, StandardIndexPage, StandardPage


class HomePageTests(WagtailPageTests):
    def test_can_create_standard_index_page_under_home_page(self):
        # You can create a StandardIndexPage under a HomePage
        self.assertCanCreateAt(HomePage, StandardIndexPage)

    def test_can_create_standard_page_under_standard_index_page(self):
        # You can create a StandardPage under StandardIndexPage
        self.assertCanCreateAt(StandardIndexPage, StandardPage)
