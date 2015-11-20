from django import template
from django.conf import settings
from django.template.loader import get_template
from wagtail.wagtaildocs.models import Document
from contact.models import ContactPage
from blog.models import BlogPage
from events.models import EventPage
from pages.models import Testimonial, Advert

register = template.Library()


@register.assignment_tag(takes_context=True)
def get_contact_fields(context):
    try:
        contact_vals = ContactPage.objects.values(
            'name_organization', 'address_1',
            'address_2', 'city', 'country', 'telephone', 'post_code'
        )[0]
        return contact_vals

    except IndexError:
        return {}
 
        
@register.inclusion_tag('documents_gallery/includes/documents_listing.html',takes_context=True)
def latest_documents(context, count=5):

    documents = Document.objects.order_by('-created_at')
    return {
        'documents': documents[:count],
        'request': context['request'],
    }

        
@register.inclusion_tag('blog/includes/blog_post_listing.html',takes_context=True)
def news_feed(context, count=2):
    blogs = BlogPage.objects.filter(live=True).order_by('-date')
    return {
        'blogs': blogs[:count],
        # required by the pageurl tag that we want to use within this template
        'request': context['request'],
    }

    
@register.inclusion_tag('events/includes/event_listing.html',takes_context=True)
def upcoming_events(context, count=3):

    events = EventPage.objects.filter(live=True)
    events = events.all().order_by('-date_from')
    return {
        'events': events[:count],
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
    return {
        'testimonials': Testimonial.objects.select_related('page'),
        'request': context['request'],
    }
    
@register.inclusion_tag('pages/includes/adverts.html', takes_context=True)
def adverts(context):
    return {
        'adverts': Advert.objects.select_related('page'),
        'request': context['request'],
    }