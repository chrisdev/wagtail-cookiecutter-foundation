# flake8: noqa

from selenium.common.exceptions import NoSuchElementException


# class NewsPageTests(SeleniumTestCase):

#     def test_news_latest(self):
#         browser = self.browser

#         browser.get('http://127.0.0.1:8000/blog-index/')

#         # Finding the Latest news item and click on it.
#         browser.find_element_by_tag_name("h4").click()

#         try:
#             browser.find_element_by_class_name('body')

#         except NoSuchElementException:
#             return False

#         return True
