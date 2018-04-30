from django.db import models
from wagtail.core.fields import RichTextField

from wagtail.admin.edit_handlers import (
    FieldPanel, MultiFieldPanel, InlinePanel
)

from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.core.models import Page
from wagtail.contrib.forms.models import AbstractEmailForm, AbstractFormField
from modelcluster.fields import ParentalKey
from utils.models import ContactFields


class FormField(AbstractFormField):
    page = ParentalKey('contact.FormPage', related_name='form_fields')


class FormPage(AbstractEmailForm):
    intro = RichTextField(blank=True)
    thank_you_text = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )


FormPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel('form_fields', label="Form fields"),
    FieldPanel('thank_you_text', classname="full"),

    MultiFieldPanel([
        FieldPanel('to_address', classname="full"),
        FieldPanel('from_address', classname="full"),
        FieldPanel('subject', classname="full"),
    ], "Email")
]


FormPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


class ContactFormField(AbstractFormField):
    page = ParentalKey('contact.ContactPage', related_name='form_fields')


class ContactPage(AbstractEmailForm, ContactFields):
    intro = models.CharField(max_length=255, blank=True)
    thank_you_text = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )


ContactPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel('form_fields', label="Contact Form fields"),
    FieldPanel('thank_you_text', classname="full"),
    MultiFieldPanel([
        FieldPanel('to_address', classname="full"),
        FieldPanel('from_address', classname="full"),
        FieldPanel('subject', classname="full"),
    ], "Form Submission Email"),
    MultiFieldPanel(ContactFields.panels, "Your Contact Information"),
]


ContactPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]
