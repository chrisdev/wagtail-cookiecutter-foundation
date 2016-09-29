Styling your Project
=====================

The projects generated with this cookiecutter include a scss file, named ``app.scss``. You can find the settings file under ``<project_slug>/pages/static/css/``.

Every component includes a set of variables that modify the core structural or visual styles. If there's something you can't customize with a variable, you can just write your own CSS to add it.

We are now using colors $primary, $secondary, $tertiary, so changing the look of your site has now become simpler. Change these main colors can give your project a whole new look within seconds. These are the default scss colors of your project.

.. code:: scss

	  $primary: #3F51B5;
	  $secondary: #303F9F;
	  $tertiary: #FF4081;
	  $off-white : #F2F2F2;
	  $tundora: #444;
	  $mine-shaft: #333;
	  $dark-metal: #222;

By default your project is set:

* ``$primary`` - Topbar, Header Backgrounds and Links
* ``$secondary`` - Social Bar and Sub-headers
* ``$tertiary`` - Buttons and Hovers
* ``$tundora`` - Headers and Paragraph 

For further documentation on using sass check out `Foundation SASS`_.

.. _`Foundation SASS`: http://foundation.zurb.com/sites/docs/sass.html