from django.db import models
from datetime import date
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse
from wagtail.wagtailcore.models import Page, Orderable
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel

from wagtail.wagtailadmin.edit_handlers import (
    FieldPanel, MultiFieldPanel, InlinePanel
)
from wagtail.wagtailsearch import index

from modelcluster.fields import ParentalKey
from utils.models import LinkFields, RelatedLink, CarouselItem
from .event_utils import export_event


EVENT_AUDIENCE_CHOICES = (
    ('public', "Public"),
    ('private', "Private"),
)

class EventIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('events.EventIndexPage', related_name='related_links')


class EventIndexPage(Page):
    intro = RichTextField(blank=True)

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
    )

    @property
    def events(self):
        events = EventPage.objects.live().descendant_of(self)
        events = events.filter(date_from__gte=date.today())
        events = events.order_by('date_from')

        return events
    
    def get_context(self, request):
            # Get events
            events = self.events
            # Filter by tag
            tag = request.GET.get('tag')
            if tag:
                events = events.filter(tags__name=tag)
    
            # Pagination
            page = request.GET.get('page')
            paginator = Paginator(events, 9)  # Show 10 events per page
            try:
                events = paginator.page(page)
            except PageNotAnInteger:
                events = paginator.page(1)
            except EmptyPage:
                events = paginator.page(paginator.num_pages)
    
            # Update template context
            context = super(EventIndexPage, self).get_context(request)
            context['events'] = events
            return context

EventIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel('related_links', label="Related links"),
]

EventIndexPage.promote_panels = Page.promote_panels


class EventPageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('events.EventPage', related_name='carousel_items')


class EventPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('events.EventPage', related_name='related_links')


class EventPageSpeaker(Orderable, LinkFields):
    page = ParentalKey('events.EventPage', related_name='speakers')
    full_name = models.CharField("Name", max_length=255, blank=True)
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    @property
    def name_display(self):
        return self.full_name

    panels = [
        FieldPanel('full_name'),
        ImageChooserPanel('image'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]


class EventPage(Page):
    date_from = models.DateField("Start date")
    date_to = models.DateField(
        "End date",
        null=True,
        blank=True,
        help_text="Not required if event is on a single day"
    )
    time_from = models.TimeField("Start time", null=True, blank=True)
    time_to = models.TimeField("End time", null=True, blank=True)
    audience = models.CharField(max_length=255, choices=EVENT_AUDIENCE_CHOICES, null=True, blank=True)
    location = models.CharField(max_length=255, null=True, blank=True)
    body = RichTextField(blank=True)
    cost = models.CharField(max_length=255, null=True, blank=True)
    signup_link = models.URLField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + (
        index.SearchField('get_audience_display'),
        index.SearchField('location'),
        index.SearchField('body'),
    )

    @property
    def event_index(self):
        return self.get_ancestors().type(EventIndexPage).last()

    def serve(self, request):
        if "format" in request.GET:
            if request.GET['format'] == 'ical':
                # Export to ical format
                response = HttpResponse(
                    export_event(self, 'ical'),
                    content_type='text/calendar',
                )
                content_dispo = 'attachment; filename=' + self.slug + '.ics'

                response['Content-Disposition'] = content_dispo
                return response
            else:
                message = 'Could not export event\n\nUnrecognised format: ' + \
                        request.GET['format']
                return HttpResponse(message, content_type='text/plain')
        else:
            return super(EventPage, self).serve(request)

EventPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('date_from'),
    FieldPanel('date_to'),
    FieldPanel('time_from'),
    FieldPanel('time_to'),
    FieldPanel('location'),
    FieldPanel('audience'),
    FieldPanel('cost'),
    FieldPanel('signup_link'),
    InlinePanel('carousel_items', label="Carousel items"),
    FieldPanel('body', classname="full"),
    InlinePanel('speakers', label="Speakers"),
    InlinePanel('related_links', label="Related links"),
]

EventPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


