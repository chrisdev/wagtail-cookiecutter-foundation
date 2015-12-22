from .base import *
import time
from selenium.common.exceptions import WebDriverException
from selenium.webdriver.support.ui import WebDriverWait

class EventsPageTests(SeleniumTestCase):

    def wait_for(self, function_with_assertion, timeout=5):
        start_time = time.time()
        while time.time() - start_time < timeout:
            try:
                return function_with_assertion()
            except (AssertionError, WebDriverException):
                time.sleep(0.1)
        # one more try, which will raise any errors if they are outstanding
        return function_with_assertion()

    def test_event_calendarlink(self):
        browser = self.browser

        browser.get('http://127.0.0.1:8000/event-index/')

        event_link = browser.find_element_by_xpath('//*[@id="content"]/ul/li/div/a')
        event_link.click()

        def calender_link_check():
            try:
                calendar_link = browser.find_element_by_id("calendar")
                calendar_link.click()

            except:
                return False

        self.wait_for(calender_link_check)

        assert "Error" not in browser.page_source