from django.db import models

from wagtail.core import blocks
from wagtail.core.models import Page, Orderable
from wagtail.core.fields import RichTextField, StreamField
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.images.blocks import ImageChooserBlock
from wagtail.images.models import Image
from wagtail.snippets.models import register_snippet
from modelcluster.fields import ParentalKey
from wagtail.admin.edit_handlers import (
    FieldPanel, MultiFieldPanel, InlinePanel, PageChooserPanel,
    StreamFieldPanel)
from wagtail.search import index
from utils.models import LinkFields, RelatedLink, CarouselItem
from wagtail.contrib.settings.models import BaseSetting, register_setting


@register_setting
class SocialMediaSettings(BaseSetting):
    facebook = models.URLField(
        help_text='Your Facebook page URL', null=True, blank=True)
    instagram = models.URLField(
        max_length=255, help_text='Your Instagram URL', null=True, blank=True)
    twitter = models.URLField(
        max_length=255, help_text='Your Twitter URL', null=True, blank=True)
    youtube = models.URLField(
        help_text='Your YouTube Channel URL', null=True, blank=True)
    linkedin = models.URLField(
        max_length=255, help_text='Your Linkedin URL', null=True, blank=True)
    github = models.URLField(
        max_length=255, help_text='Your Github URL', null=True, blank=True)
    facebook_appid = models.CharField(
        max_length=255, help_text='Your Facbook AppID', null=True, blank=True)


@register_setting
class SiteBranding(BaseSetting):
    logo = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    site_name = models.CharField(max_length=250, null=True, blank=True)
    panels = [
        ImageChooserPanel('logo'),
        FieldPanel('site_name'),
    ]


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
    content = RichTextField(null=True, blank=True,)
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
    title_text = RichTextField(null=True, blank=True)
    body = RichTextField(null=True, blank=True)
    feed_image = models.ForeignKey(
        Image,
        help_text="An optional image to represent the page",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    indexed_fields = ('body', )

    class Meta:
        verbose_name = "Homepage"


HomePage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('title_text', classname="full"),
    FieldPanel('body', classname="full"),
    InlinePanel('carousel_items', label="Carousel items"),
    InlinePanel('content_items', label="Content Blocks"),
    InlinePanel('related_links', label="Related links"),
]

HomePage.promote_panels = [
    MultiFieldPanel(Page.promote_panels, "Common page configuration"),
    ImageChooserPanel('feed_image'),
]


class StandardIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('pages.StandardIndexPage', related_name='related_links')


class StandardIndexPage(Page):
    TEMPLATE_CHOICES = [
        ('pages/standard_index_page.html', 'Default Template'),
        ('pages/standard_index_page_grid.html', 'Grid Also In This Section'),
    ]
    subtitle = models.CharField(max_length=255, blank=True)
    intro = RichTextField(blank=True)
    template_string = models.CharField(
        max_length=255, choices=TEMPLATE_CHOICES,
        default='pages/standard_index_page.html'
    )
    feed_image = models.ForeignKey(
        Image,
        help_text="An optional image to represent the page",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    indexed_fields = ('intro', )

    @property
    def template(self):
        return self.template_string


StandardIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('subtitle', classname="full title"),
    FieldPanel('intro', classname="full"),
    FieldPanel('template_string'),
    InlinePanel('related_links', label="Related links"),
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
    TEMPLATE_CHOICES = [
        ('pages/standard_page.html', 'Default Template'),
        ('pages/standard_page_full.html', 'Standard Page Full'),
    ]
    subtitle = models.CharField(max_length=255, blank=True)
    intro = RichTextField(blank=True)
    body = StreamField([
        ('paragraph', blocks.RichTextBlock()),
        ('image', ImageChooserBlock()),
        ('html', blocks.RawHTMLBlock()),
    ])
    template_string = models.CharField(
        max_length=255, choices=TEMPLATE_CHOICES,
        default='pages/standard_page.html'
    )
    feed_image = models.ForeignKey(
        Image,
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + [
        index.SearchField('intro'),
        index.SearchField('body'),
    ]

    @property
    def template(self):
        return self.template_string


StandardPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('subtitle', classname="full title"),
    FieldPanel('intro', classname="full"),
    StreamFieldPanel('body'),
    FieldPanel('template_string'),
    InlinePanel('carousel_items', label="Carousel items"),
    InlinePanel('related_links', label="Related links"),

]

StandardPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


class VideoGalleryPageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('pages.VideoGalleryPage', related_name='carousel_items')


class VideoGalleryPage(Page):
    intro = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        Image,
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + [
        index.SearchField('intro'),
    ]


VideoGalleryPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel('carousel_items', label="Carousel items"),

]

VideoGalleryPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


class TestimonialPage(Page):
    intro = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        Image,
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + [
        index.SearchField('intro'),
    ]


TestimonialPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
]

TestimonialPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


class ContentBlock(LinkFields):
    page = models.ForeignKey(
        Page,
        related_name='contentblocks',
        null=True,
        blank=True,
        on_delete=models.SET_NULL
    )
    title = models.CharField(max_length=255)
    body = RichTextField()
    summary = RichTextField(blank=True)
    slug = models.SlugField()
    panels = [
        PageChooserPanel('page'),
        FieldPanel('title'),
        FieldPanel('summary'),
        FieldPanel('body', classname="full"),
        FieldPanel('slug'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    def __str__(self):
        return u"{0}[{1}]".format(self.title, self.slug)


register_snippet(ContentBlock)


class Testimonial(LinkFields):
    page = models.ForeignKey(
        Page,
        related_name='testimonials',
        null=True,
        blank=True,
        on_delete=models.SET_NULL
    )
    name = models.CharField(max_length=150)
    photo = models.ForeignKey(
        Image, null=True, blank=True, on_delete=models.SET_NULL
    )
    text = RichTextField(blank=True)

    panels = [
        PageChooserPanel('page'),
        FieldPanel('name'),
        ImageChooserPanel('photo'),
        FieldPanel('text'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    def __str__(self):
        return self.name


register_snippet(Testimonial)


class Advert(LinkFields):
    page = models.ForeignKey(
        Page,
        related_name='adverts',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
    )
    title = models.CharField(max_length=150, null=True)
    image = models.ForeignKey(
        Image, null=True, blank=True, on_delete=models.SET_NULL
    )
    button_text = models.CharField(max_length=150, null=True)
    text = RichTextField(blank=True)

    panels = [
        PageChooserPanel('page'),
        FieldPanel('title'),
        ImageChooserPanel('image'),
        FieldPanel('text'),
        FieldPanel('button_text'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    def __str__(self):
        return self.title


register_snippet(Advert)


# Faqs Page

class FaqsPage(Page):
    body = StreamField([
        ('faq_question', blocks.CharBlock(classname="full title")),
        ('faq_answer', blocks.RichTextBlock()),
    ])


FaqsPage.content_panels = [
    FieldPanel('title', classname="full title"),
    StreamFieldPanel('body'),
]
