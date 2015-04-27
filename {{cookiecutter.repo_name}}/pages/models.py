from django.db import models

from wagtail.wagtailcore.models import Page, Orderable
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtaildocs.edit_handlers import DocumentChooserPanel
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtailimages.models import Image
from modelcluster.fields import ParentalKey
from wagtail.wagtailadmin.edit_handlers import (
    FieldPanel, MultiFieldPanel, InlinePanel, PageChooserPanel
)
from wagtail.wagtailsearch import index
from wagtail.wagtailforms.models import AbstractEmailForm, AbstractFormField


class LinkFields(models.Model):
    link_external = models.URLField("External link", blank=True)
    link_page = models.ForeignKey(
        'wagtailpages.Page',
        null=True,
        blank=True,
        related_name='+'
    )
    link_document = models.ForeignKey(
        'wagtaildocs.Document',
        null=True,
        blank=True,
        related_name='+'
    )

    @property
    def link(self):
        if self.link_page:
            return self.link_page.url
        elif self.link_document:
            return self.link_document.url
        else:
            return self.link_external

    panels = [
        FieldPanel('link_external'),
        PageChooserPanel('link_page'),
        DocumentChooserPanel('link_document'),
    ]

    class Meta:
        abstract = True


class ContactFields(models.Model):
    telephone = models.CharField(max_length=20, blank=True)
    email = models.EmailField(blank=True)
    address_1 = models.CharField(max_length=255, blank=True)
    address_2 = models.CharField(max_length=255, blank=True)
    city = models.CharField(max_length=255, blank=True)
    country = models.CharField(max_length=255, blank=True)
    post_code = models.CharField(max_length=10, blank=True)

    panels = [
        FieldPanel('telephone'),
        FieldPanel('email'),
        FieldPanel('address_1'),
        FieldPanel('address_2'),
        FieldPanel('city'),
        FieldPanel('country'),
        FieldPanel('post_code'),
    ]

    class Meta:
        abstract = True


# Carousel items

class CarouselItem(LinkFields):
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    embed_url = models.URLField("Embed URL", blank=True)
    caption = RichTextField(blank=True)

    panels = [
        ImageChooserPanel('image'),
        FieldPanel('embed_url'),
        FieldPanel('caption'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    class Meta:
        abstract = True


# Related links

class RelatedLink(LinkFields):
    title = models.CharField(max_length=255, help_text="Link title")

    panels = [
        FieldPanel('title'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    class Meta:
        abstract = True


# Concrete Pages

class HomePageContentItem(Orderable, LinkFields):
    page = ParentalKey('pages.HomePage', related_name='content_items')
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    title = models.CharField(max_length=100)
    content = RichTextField()
    summary = RichTextField(blank=True)
    slug = models.SlugField()

    panels = [
        FieldPanel('title'),
        ImageChooserPanel('image'),
        FieldPanel('summary'),
        FieldPanel('content'),
        FieldPanel('slug'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]


class HomePageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('pages.HomePage', related_name='carousel_items')


class HomePageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('pages.HomePage', related_name='related_links')


class HomePage(Page):
    body = RichTextField(null=True, blank=True)

    search_fields = Page.search_fields + (
        index.SearchField('body'),
    )

    class Meta:
        verbose_name = "Homepage"

HomePage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('welcome_text', classname="full"),
    InlinePanel(HomePage, 'carousel_items', label="Carousel items"),
    InlinePanel(HomePage, 'content_items', label="Content Blocks"),
    InlinePanel(HomePage, 'related_links', label="Related links"),
]

HomePage.promote_panels = Page.promote_panels


class StandardIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('pages.StandardIndexPage', related_name='related_links')


class StandardIndexPage(Page):
    subtitle = models.CharField(max_length=255, blank=True)
    intro = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        Image,
        help_text="An optional image to represent the page",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    indexed_fields = ('intro', )

StandardIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('subtitle', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel(StandardIndexPage, 'related_links', label="Related links"),
]

StandardIndexPage.promote_panels = [
    MultiFieldPanel(Page.promote_panels, "Common page configuration"),
    ImageChooserPanel('feed_image'),
]


# Standard page

class StandardPageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('pages.StandardPage', related_name='carousel_items')


class StandardPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('pages.StandardPage', related_name='related_links')


class StandardPage(Page):
    subtitle = models.CharField(max_length=255, blank=True)
    intro = RichTextField(blank=True)
    body = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        Image,
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
        index.SearchField('body'),
    )


StandardPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('subtitle', classname="full title"),
    FieldPanel('intro', classname="full"),
    FieldPanel('body', classname="full"),
    InlinePanel(StandardPage, 'carousel_items', label="Carousel items"),
    InlinePanel(StandardPage, 'related_links', label="Related links"),
    FieldPanel('template_string')

]

StandardPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


# Forms
class FormField(AbstractFormField):
    page = ParentalKey('FormPage', related_name='form_fields')


class FormPage(AbstractEmailForm):
    intro = RichTextField(blank=True)
    thank_you_text = RichTextField(blank=True)


FormPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel(FormPage, 'form_fields', label="Form fields"),
    FieldPanel('thank_you_text', classname="full"),

    MultiFieldPanel([
        FieldPanel('to_address', classname="full"),
        FieldPanel('from_address', classname="full"),
        FieldPanel('subject', classname="full"),
    ], "Email")
]


class ContactFormField(AbstractFormField):
    page = ParentalKey('ContactPage', related_name='form_fields')


class ContactPage(AbstractEmailForm, ContactFields):
    intro = models.CharField(max_length=255, blank=True)
    thank_you_text = RichTextField(blank=True)


ContactPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel(FormPage, 'form_fields', label="Form fields"),
    FieldPanel('thank_you_text', classname="full"),
    MultiFieldPanel(ContactFields.panels, "Contact"),
    MultiFieldPanel([
        FieldPanel('to_address', classname="full"),
        FieldPanel('from_address', classname="full"),
        FieldPanel('subject', classname="full"),
    ], "Email")
]
