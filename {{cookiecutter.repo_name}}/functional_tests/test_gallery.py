from .base import *

class GalleryPageTests(SeleniumTestCase):
    
    def test_gallery_items(self):
        browser = self.browser

        browser.get('http://127.0.0.1:8000/gallery/')
        assert "we don't have any Galleries" not in browser.page_source

    def test_gallery_images(self):
        browser = self.browser

        browser.get('http://127.0.0.1:8000/gallery/')

        link = browser.find_element_by_tag_name("center")
        link.click()
        assert "No images are tagged" not in browser.page_source