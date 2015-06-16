from django.test import LiveServerTestCase
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.firefox.webdriver import WebDriver


class SeleniumTestCase(LiveServerTestCase):

    @classmethod
    def setUpClass(cls):
        cls.selenium = WebDriver()
        super(SeleniumTestCase, cls).setUpClass()

    @classmethod
    def tearDownClass(cls):
        super(SeleniumTestCase, cls).tearDownClass()
        cls.selenium.quit()

class ContactAppTests(SeleniumTestCase):

    def test_contact(self):
        selenium = self.selenium

        # Opening the Contact-us page to test
        selenium.get('http://127.0.0.1:8000/contact-us/')

        # find the form elements
        name = selenium.find_element_by_id('id_your-name')
        email = selenium.find_element_by_id('id_your-email-address')
        message = selenium.find_element_by_id('id_your-message')
 
        submit = selenium.find_element_by_name('Send')
 
        # Fill the form with Sample data
        name.send_keys('Test name')
        email.send_keys('testemail@testemail.com')
        message.send_keys('Test message for sample test.')
 
        # Submitting the form
        submit.send_keys(Keys.RETURN)
 
        # Check the returned result
        assert 'Thanks for you interest' in selenium.page_source

if __name__ == '__main__':
    unittest.main(warnings='ignore')