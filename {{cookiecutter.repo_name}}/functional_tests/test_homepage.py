from .base import *

HOMEPAGE = 'http://127.0.0.1:8000'

class HomepageTests(SeleniumTestCase):

    def test_home_title(self):
        self.browser.get(HOMEPAGE)
        self.assertIn("Homepage", self.browser.title)

    def test_home_files(self):
        self.browser.get(HOMEPAGE + "/robots.txt")
        self.assertNotIn("Not Found", self.browser.title)
        self.browser.get(HOMEPAGE + "/humans.txt")
        self.assertNotIn("Not Found", self.browser.title)

    def test_home_heading(self):
        browser = self.browser

        browser.get(HOMEPAGE)

        heading = browser.find_element_by_class_name('rich-text')
        heading_text = heading.text
        assert 'Welcome to Wagtail Cookiecutter Foundation' in heading_text

    def test_features(self):
        browser = self.browser
        browser.get(HOMEPAGE)

        self.assertTrue(browser.find_element_by_class_name('icon').size())