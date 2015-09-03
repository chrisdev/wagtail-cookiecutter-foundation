from django.utils.safestring import mark_safe
from django.utils.html import format_html, format_html_join
from django.conf import settings
from wagtail.wagtailcore import hooks
from wagtail.wagtailcore.whitelist import attribute_rule, check_url, allow_without_attributes


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
    js_includes = format_html_join('\n', '<script src="{0}{1}"></script>',
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
        'libs/font-awesome/css/font-awesome.min.css'
    ]

    css_includes = format_html_join(
        '\n', '<link rel="stylesheet" href="{0}{1}">', ((settings.STATIC_URL, filename) for filename in css_files))

    return css_includes