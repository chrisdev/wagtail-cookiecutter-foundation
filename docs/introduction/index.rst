What's included
===============

- A Django project with Wagtail_ pre-installed with support for all the
  `Zurb Foundation`_ HTML and CSS UI components (typography, forms, buttons,
  navigation and other interface components)

- A comprehensive suite of apps to use for building your site.
  We take an approach similar to the `Wagtail Demo Project`_ but we use a
  modular approach so that can pick and choose the functionality you want to include
  on you site. We provide individual modules for:

    - ``pages`` - Hompage, Standard Pages, People Page, Contact Page, etc.
    - ``blog`` - Blogging or site news
    - ``events`` - Event management
    - ``photo_gallery``- To facilitate easy  management of photo galleries
    - ``utils`` - utility functions, templatetags and filters

.. _`Zurb Foundation`: https://foundation.zurb.com
.. _Wagtail: https://wagtail.io
.. _`Wagtail Demo Project`: https://github.com/torchbox/wagtaildemo


- Templates and template tags to support Foundation ``HTML`` and ``CSS UI``
  components including:

    - Top bar including (sticky nav)
    - Off canvas
    - Bread crumbs
    - SubNav
    - Pagination

- Full libsass_ Foundation Sass support through `django-compressor`_/`django-libsass`_

- We also provide support for updating your Foundation framework through
  Bower_ and provide support for an alternative front-end work flow based on
  using Bower_ and a task runner like Grunt_ or Gulp_

- Support for Vagrant_ which uses the `torchbox/wagtail base box`_

- Deployment and provisioning using Ansible_ that has been extensively tested on
  Digital Ocean and Linode VPS but should be easy to modified for hosting on
  EC2 etc..

.. _`torchbox/wagtail base box`: https://github.com/torchbox/vagrant-wagtail-base
.. _Ansible: http://www.ansible.com/home
.. _libsass: https://github.com/sass/libsass
.. _django-compressor: https://github.com/sass/libsass
.. _django-libsass: https://github.com/torchbox/django-libsass
.. _Bower: http://bower.io
.. _Gulp: https://gulpjs.com
.. _Grunt: https://gruntjs.com
.. _Vagrant: https://www.vagrantup.com/