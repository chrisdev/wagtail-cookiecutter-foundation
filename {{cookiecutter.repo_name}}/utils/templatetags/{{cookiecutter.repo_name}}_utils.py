from django import template
from django.conf import settings
from django.template.loader import get_template
from contact.models import ContactPage
from blog.models import BlogPage

register = template.Library()


@register.assignment_tag(takes_context=True)
def get_contact_fields(context):
    try:
        contact_vals = ContactPage.objects.values(
            'name_organization', 'address_1',
            'address_2', 'city', 'country', 'telephone'
        )[0]
        return contact_vals

    except IndexError:
        return {}
        
@register.inclusion_tag('blog/includes/blog_post_listing.html',takes_context=True)
def news_feed(context, count=2):
    blogs = BlogPage.objects.filter(live=True).order_by('-date')
    return {
        'blogs': blogs[:count],
        # required by the pageurl tag that we want to use within this template
        'request': context['request'],
    }