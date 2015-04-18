from django.db import models

from wagtail.wagtailcore.models import Page, Orderable
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtaildocs.edit_handlers import DocumentChooserPanel
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from modelcluster.fields import ParentalKey
from wagtail.wagtailadmin.edit_handlers import FieldPanel, MultiFieldPanel, InlinePanel, PageChooserPanel

class LinkFields(models.Model):
    link_external = models.URLField("External link", blank=True)
    link_page = models.ForeignKey(
        'wagtailcore.Page',
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

# Home Page
class HomePageContentItem(Orderable, LinkFields):
    page = ParentalKey('core.HomePage', related_name='content_items')
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

class HomePage(Page):
    hero_text = models.TextField(blank=True)
    welcome_text  = RichTextField(blank=True)
    copyright_year  = models.TextField(blank=True)

    class Meta:
        verbose_name = "Homepage"

HomePage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('hero_text', classname="full"),
    FieldPanel('welcome_text', classname="full"),
    FieldPanel('copyright_year', classname="full"),
    InlinePanel(HomePage, 'content_items', label="Content Blocks"),
]

HomePage.promote_panels = Page.promote_panels
