CHANGES
========
0.3.0 (2016-12-22)
-------------------
**Whats New**

- Added Wand and ImageMagick to support gif
- Added Social Media settings to the sites settings
- Added StreamField to the BlogPage to replace RichTextField
- Added the foundation accordion menu for the sitemap
- Added table for Documents Page results
- Added new fixed menu with social media bar
- New foundation palette to match AA contrast
- Added Lightbox2 for the Photo Gallery since Clearing Lightbox is no longer supported in Foundation
- Support for LetsEncrypt

**Support Updates**

- Added support for Django 1.10
- Added support for Wagtail 1.8
- Added support for Foundation 6.3.0

**Bug Fixes**

- Modernized site design for new foundation
- Indent size for html, scss, css and js
- Fixed Upcoming Events tag to remove event from feed once the date has passed
- Fixed off canvas menu behavior with new foundation
- Fixed incorrect sequence values in initial_data.sql

0.2.0 (2016-01-16)
-------------------
- Now supports Foundation 6

0.0.2 (2016-01-11)
-------------------
- Added support for Django 1.9 and wagtail 1.3.1
- Applied workaround for failing wagtailimages migration on Django 1.8.8 / 1.9.1 with Postgres      
- Fix Python3 relative import 


0.0.1 (2015-12-16)
-------------------
- Initial release.