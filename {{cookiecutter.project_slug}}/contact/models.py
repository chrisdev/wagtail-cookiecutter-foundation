from django.db import models
from wagtail.wagtailcore.fields import RichTextField

from wagtail.wagtailadmin.edit_handlers import (
    FieldPanel, MultiFieldPanel, InlinePanel
)

from wagtail.wagtailforms.models import AbstractEmailForm, AbstractFormField
from modelcluster.fields import ParentalKey
from utils.models import ContactFields


class FormField(AbstractFormField):
    page = ParentalKey('contact.FormPage', related_name='form_fields')


class FormPage(AbstractEmailForm):
    intro = RichTextField(blank=True)
    thank_you_text = RichTextField(blank=True)


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


class ContactFormField(AbstractFormField):
    page = ParentalKey('contact.ContactPage', related_name='form_fields')


class ContactPage(AbstractEmailForm, ContactFields):
    intro = models.CharField(max_length=255, blank=True)
    thank_you_text = RichTextField(blank=True)


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
