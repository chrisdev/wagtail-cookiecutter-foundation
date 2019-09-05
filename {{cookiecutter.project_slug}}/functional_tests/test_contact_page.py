# flake8: noqa


# class ContactAppTests(SeleniumTestCase):

#     def test_contact(self):
#         browser = self.browser

#         # Opening the Contact-us page to test
#         browser.get('http://127.0.0.1:8000/contact-us/')

#         # find the form elements
#         name = browser.find_element_by_id('id_name')
#         email = browser.find_element_by_id('id_e-mail')
#         message = browser.find_element_by_id('id_message')
#         submit = browser.find_element_by_name('Send')

#         # Fill the form with Sample data
#         name.send_keys('Test name')
#         email.send_keys('testemail@testemail.com')
#         message.send_keys('Test message for sample test.')

#         # Submitting the form
#         submit.send_keys(Keys.RETURN)
#         # Check the returned result
#         assert 'Thanks for your interest' in browser.page_source
