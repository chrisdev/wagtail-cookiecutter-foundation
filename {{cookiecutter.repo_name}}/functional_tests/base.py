from django.contrib.staticfiles.testing import StaticLiveServerTestCase
from django.utils.translation import activate
from selenium import webdriver


class SeleniumTestCase(StaticLiveServerTestCase):

    def setUp(self):
        self.browser = webdriver.Firefox()
        self.browser.implicitly_wait(3)
        activate('en')

    def tearDown(self):
        self.browser.quit()
