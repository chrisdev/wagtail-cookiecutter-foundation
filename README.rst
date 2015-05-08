Wagtail cookiecutter Foundation
================================
A cookiecutter_ template for Wagtail CMS featuring `Zurb Foundation`_.

.. _cookiecutter: https://github.com/audreyr/cookiecutter
.. _Wagtail CMS: https://wagtail.io
.. _`Zurb Foundation`: https://foundation.zurb.com




What's included
---------------

 - A Django project with _Wgtail preinstalled
 - A complete suite of apps for to use for building your site. Rather that provide a monoltic ``core`` app we provide
   seperate modules for 
    - ``pages`` - Hompage, Standard Pages, People Page, Contact Page, etc.
    - ``blog`` - Bloging or site news
    - ``events`` - Event managment
    - ``Gallery`` - Media gallerys
    - ``utils`` - templatetags and filters
    All of these apps come with a comple set of templates and templte tags
 - Vagrant configuration (which uses the [torchbox/wagtail](https://github.com/torchbox/vagrant-wagtail-base) base box)
 - Asible deployemnt and provisioning tested on Digital Ocean and Lininode style Virtual Servers but can be easily
   modified for EC2 etc.
 - Nginx Configration template for SSL and Non SSL hosting.

Usage
-----

Firstly, make sure cookiecutter is installed: [Installation](http://cookiecutter.readthedocs.org/en/latest/installation.html)

Then run:

     cookiecutter https://github.com/chrisdev/wagtail-cookiecutter-foundation.git


Answer the questions and you're done!
