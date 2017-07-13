from wagtail.tests.utils import WagtailPageTests

from pages.models import HomePage
from .models import EventIndexPage, EventPage


class EventPageTests(WagtailPageTests):
    def test_can_create_under_event_index_page(self):
        # You can create a EventPage under EventIndexPage
        self.assertCanCreateAt(EventIndexPage, EventPage)

    def test_cant_create_under_home_page(self):
        # You can not create a EventPage under HomePage
        self.assertCanNotCreateAt(HomePage, EventPage)
