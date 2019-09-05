from django import template
from wagtail.documents.models import Document
from contact.models import ContactPage
from blog.models import BlogPage
from pages.models import Testimonial, Advert

register = template.Library()


@register.simple_tag(takes_context=True)
def get_contact_fields(context):
    try:
        contact_vals = ContactPage.objects.values(
            'name_organization', 'address_1',
            'address_2', 'city', 'country', 'telephone', 'telephone_2', 'post_code', 'email', 'email_2'
        )[0]
        return contact_vals

    except IndexError:
        return {}


@register.inclusion_tag(
    'documents_gallery/includes/documents_listing.html', takes_context=True)
def latest_documents(context, count=5):

    documents = Document.objects.order_by('-created_at')
    return {
        'documents': documents[:count],
        'request': context['request'],
    }


@register.inclusion_tag('blog/includes/blog_post_listing.html',
                        takes_context=True)
def news_feed(context, count=2):
    blogs = BlogPage.objects.filter(live=True).order_by('-date')
    return {
        'blogs': blogs[:count],
        # required by the pageurl tag that we want to use within this template
        'request': context['request'],
    }


@register.inclusion_tag('blog/includes/blog_more_list.html', takes_context=True)
def more_news(context, count=2):
    blogs = BlogPage.objects.filter(live=True).order_by('-date')
    return {
        'blogs': blogs[:count],
        # required by the pageurl tag that we want to use within this template
        'request': context['request'],
    }


@register.filter
def time_display(time):
    """Format the time - is this really required"""
    # Get hour and minute from time object
    hour = time.hour
    minute = time.minute

    # Convert to 12 hour format
    if hour >= 12:
        pm = True
        hour -= 12
    else:
        pm = False
    if hour == 0:
        hour = 12

    # Hour string
    hour_string = str(hour)

    # Minute string
    if minute != 0:
        minute_string = "." + str(minute)
    else:
        minute_string = ""

    # PM string
    if pm:
        pm_string = "pm"
    else:
        pm_string = "am"

    # Join and return
    return "".join([hour_string, minute_string, pm_string])


@register.inclusion_tag('pages/includes/testimonials.html', takes_context=True)
def testimonials(context):
    the_page = context['page']
    all_testimonials = Testimonial.objects.select_related()
    return {
        'page_testimonials': all_testimonials.filter(page=the_page),
        'non_page_associated_testimonials': all_testimonials.filter(page__isnull=True),
        'testimonials': all_testimonials,
        'request': context['request'],
    }


@register.inclusion_tag('pages/includes/testimonials_list.html', takes_context=True)
def testimonials_list(context):
    the_page = context['page']
    all_testimonials = Testimonial.objects.select_related()
    return {
        'page_testimonials': all_testimonials.filter(page=the_page),
        'non_page_associated_testimonials': all_testimonials.filter(page__isnull=True),
        'testimonials': all_testimonials,
        'request': context['request'],
    }


@register.inclusion_tag('pages/includes/adverts.html', takes_context=True)
def adverts(context):
    the_page = context['page']
    all_adverts = Advert.objects.select_related()
    return {
        'page_advert': all_adverts.filter(page=the_page),
        'non_page_associated_adverts': all_adverts.filter(page__isnull=True),
        'adverts': all_adverts,
        'request': context['request'],
    }
