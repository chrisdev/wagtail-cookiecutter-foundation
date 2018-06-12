from django.urls import reverse
from django.utils.html import format_html, format_html_join
from django.utils.translation import ugettext_lazy as _
from django.conf import settings
from wagtail.core import hooks
from wagtail.admin.menu import MenuItem
from wagtail.core.whitelist import attribute_rule, check_url


@hooks.register('register_settings_menu_item')
def register_django_admin_menu_item():
    return MenuItem(_('Django Admin'), reverse('admin:index'),
                    classnames='icon icon-cogs', order=700)


@hooks.register('construct_whitelister_element_rules')
def whitelister_element_rules():
    # Whitelist custom elements to the hallo.js editor
    return {
        'a': attribute_rule({'href': check_url, 'target': True}),
        'blockquote': attribute_rule({'class': True})
    }


@hooks.register('insert_editor_js')
def editor_js():
    # Add extra JS files to the admin
    js_files = [
        'js/hallo-custom.js',
    ]
    js_includes = format_html_join(
        '\n', '<script src="{0}{1}"></script>',
        ((settings.STATIC_URL, filename) for filename in js_files)
    )

    return js_includes + format_html(
        """
        <script>
            registerHalloPlugin('blockquotebutton');
            registerHalloPlugin('blockquotebuttonwithclass');
        </script>
        """
    )


@hooks.register('insert_editor_css')
def editor_css():
    # Add extra CSS files to the admin like font-awesome
    css_files = [
        'node_modules/font-awesome/css/font-awesome.min.css'
    ]

    css_includes = format_html_join(
        '\n', '<link rel="stylesheet" href="{0}{1}">',
        ((settings.STATIC_URL, filename) for filename in css_files)
    )

    return css_includes
