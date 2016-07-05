App Modules
=============

We provide a comprehensive suite of apps to use for building your site. We take  a modular approach so that can pick and choose the functionality you want to include. We provide separate modules for:

    - ``pages`` - Different pages including Homepage, Standard & Faqs Page etc.
    - ``blog`` - Blog or site news
    - ``contact`` - Contact Page with included contact us form
    - ``documents_gallery`` - Organize documents in folders using wagtail tags
    - ``events`` - Events
    - ``people`` - For the people in your organization or team.
    - ``photo_gallery`` - Create photo galleries using wagtail tags
    - ``products`` - Ideal for a product or portfolio showcase
    - ``faq`` - FAQ and answers.
    - ``utils`` - Various utility functions, templatetags and filters   


Photo Gallery
---------------

The Photo Gallery module allows you to easily create Photo Galleries for your site Using the built in tagging functionality. To create Photo Galleries ::

1) Go to Images section of the Wagtail Admin and click on Add an Image.
2) Drag and drop images you want in your gallery and add common tag name to all the uploaded Images. You can also add same tag name to any existing images that you want to include in the gallery.
3) Next create a Gallery Index Page which displays all your galleries.
4) Add a Gallery Child Page and enter the tags of the Images that you want to appear in the Gallery. You can also choose a feed image so it can appear in Gallery index page.
5) Your Gallery is now created with all images you want.


Documents Folder
------------------

This module allows to organize documents into “folders” based on common tags. In many ways it works the same way as the Photo Gallery module ::

1) Go to Documents section in Wagtail Admin.
2) Add add a common tag name to all documents that you want to appear in the folder.
3) Now create a Document Index page which displays all your Document folders.
4) Create a Document Folder Child Page and enter the tags for the document that you want to appear in the folder.
5) The Folder is now created with all the Documents matching the tags you want.


Feeds
------

Syndication feeds come in two flavors:

* BasicFeed - A standard RSS V 2.0.1 feed designed to be used without item enclosures.
* ExtendedFeed - An RSS V2/Atom Feed with support for item enclosures such as images or video. Use this if when want to integrate your feed with services like MailChimp or Flipboard.

The feeds module provides the flexibility of allowing you to specify the app module, PageModel and data fields to use for the feed. This is current being done through settings variables. In future versions we plan to provide a page model for truly plug and play functionality. For example, if we wish to create a Syndication Feed based on the BlogPage model which is the blog app ::

    FEED_APP_LABEL = 'blog'
    FEED_MODEL_NAME = 'BlogPage'

To specify the use of the BlogPage.intro as for the item description and The body field for the content enclosure add the following to your settings ::

    FEED_ITEM_DESCRIPTION_FIELD = 'intro'
    FEED_ITEM_CONTENT_FIELD = 'body'

Then add the feed level attributes to the settings as follows ::

    FEED_TITLE = 'From the Desk of John Blog'
    FEED_LINK = '/news/'
    FEED_DESCRIPTION = "News and views from around the Web"
    FEED_AUTHOR_EMAIL = 'john@johnblog.com'
    FEED_AUTHOR_LINK = 'https://johnblog.com'

Finally reference it in the url.py ::

    url(r'^blog/feed/basic$', BasicFeed(), name='basic_feed'),
    url(r'^blog/feed/extended$', ExtendedFeed(), name='extended_feed'),