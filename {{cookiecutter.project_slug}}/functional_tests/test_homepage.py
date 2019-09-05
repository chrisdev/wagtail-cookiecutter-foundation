# flake8: noqa

from selenium.common.exceptions import NoSuchElementException

HOMEPAGE = 'http://127.0.0.1:8000'


# class HomepageTests(SeleniumTestCase):

#     def test_home_title(self):
#         self.browser.get(HOMEPAGE)
#         self.assertIn("Homepage", self.browser.title)

#     def test_home_files(self):
#         self.browser.get(HOMEPAGE + "/static/favicon.ico")
#         self.assertNotIn("Not Found", self.browser.title)

#     def test_home_heading(self):
#         browser = self.browser

#         browser.get(HOMEPAGE)

#         heading = browser.find_element_by_class_name('rich-text')
#         heading_text = heading.text
#         assert 'Welcome to Wagtail Cookiecutter Foundation' in heading_text

#     def test_features(self):
#         browser = self.browser
#         browser.get(HOMEPAGE)

#         try:
#             browser.find_element_by_class_name('icon')

#         except NoSuchElementException:
#             return False

#         return True
