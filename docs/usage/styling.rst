Styling your Project
=====================

The projects generated with this cookiecutter include a settings file, named ``_settings.scss``. You can find the settings file under ``<project_slug>/pages/static/css/``.

Every component includes a set of variables that modify core structural or visual styles. If there's something you can't customize with a variable, you can just write your own CSS to add it.

Here's an example set of settings variables. These change the default styling of buttons:

.. code:: scss

    // Default padding for button.
    $button-padding: 0.85em 1em !default;

    // Default margin for button.
    $button-margin: 0 $global-padding $global-padding 0 !default;

    // Default fill for button. Is either solid or hollow.
    $button-fill: solid !default;

    // Default background color for button.
    $button-background: $primary-color !default;

    // Default hover background color for button.
    $button-background-hover: scale-color($button-background, $lightness: -15%) !default;

    // Default font color for button.
    $button-font-color: #fff !default;

    // Default alternative font color for button.
    $button-font-color-alt: #000 !default;

    // Default radius for button.
    $button-radius: 0 !default;

    // Default sizes for button.
    $button-sizes: (
      tiny: 0.7,
      small: 0.8,
      medium: 1,
      large: 1.3,
    ) !default;

    // Default font size for button.
    $button-font-size: 0.9rem !default;

    // Default opacity for a disabled button.
    $button-opacity-disabled: 0.25 !default;

For further documentation on using sass check out `Foundation SASS`_.

.. _`Foundation SASS`: http://foundation.zurb.com/sites/docs/sass.html
