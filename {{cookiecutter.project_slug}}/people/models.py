from django.db import models
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from wagtail.core.models import Page, Orderable
from wagtail.core.fields import RichTextField
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.images.models import Image


from wagtail.admin.edit_handlers import (
    FieldPanel, MultiFieldPanel, InlinePanel
)
from wagtail.snippets.models import register_snippet
from wagtail.snippets.edit_handlers import SnippetChooserPanel

from modelcluster.fields import ParentalKey
from modelcluster.tags import ClusterTaggableManager
from taggit.models import Tag, TaggedItemBase
from utils.models import ContactFields, RelatedLink


# Person page
class PersonIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('people.PersonIndexPage', related_name='related_links')


class PersonIndexPage(Page):
    subtitle = models.CharField(max_length=255, blank=True)
    intro = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    indexed_fields = ('intro', )

    @property
    def persons(self):
        # Get list of live blog pages that are descendants of this page
        persons = PersonPage.objects.live().descendant_of(self)

        return persons

    @property
    def tag_list(self):
        tag_ids = PersonPageTag.objects.all().values_list('tag_id', flat=True)
        return Tag.objects.filter(pk__in=tag_ids)

    def get_context(self, request):
        # Get persons
        persons = self.persons
        # Filter by tag
        tag = request.GET.get('tag')
        if tag:
            persons = persons.filter(tags__name=tag)

        # Pagination
        page = request.GET.get('page')
        paginator = Paginator(persons, 10)  # Show 10 persons per page
        try:
            persons = paginator.page(page)
        except PageNotAnInteger:
            persons = paginator.page(1)
        except EmptyPage:
            persons = paginator.page(paginator.num_pages)

        # Update template context
        context = super(PersonIndexPage, self).get_context(request)
        context['persons'] = persons
        return context


PersonIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('subtitle'),
    FieldPanel('intro', classname="full"),
    InlinePanel('related_links', label="Related links"),
]


PersonIndexPage.promote_panels = [
    MultiFieldPanel(Page.promote_panels, "Common page configuration"),
    ImageChooserPanel('feed_image'),
]


class PersonPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('people.PersonPage', related_name='related_links')


class PersonPageTag(TaggedItemBase):
    content_object = ParentalKey(
        'people.PersonPage', related_name='tagged_items'
    )


@register_snippet
class PersonRole(models.Model):
    name = models.CharField(max_length=255)

    panels = [
        FieldPanel('name')
    ]

    def __unicode__(self):
        return self.name


class PersonPage(Page, ContactFields):
    role = models.ForeignKey(
        PersonRole, blank=True,
        null=True, related_name='+', on_delete=models.SET_NULL
    )
    intro = RichTextField(blank=True)
    biography = RichTextField(blank=True)
    tags = ClusterTaggableManager(through=PersonPageTag, blank=True)
    image = models.ForeignKey(
        Image,
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    feed_image = models.ForeignKey(
        Image,
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    indexed_fields = ('title', 'intro', 'biography')


PersonPage.content_panels = [
    FieldPanel('title', classname="title"),
    SnippetChooserPanel('role'),
    FieldPanel('intro', classname="full"),
    FieldPanel('biography', classname="full"),
    ImageChooserPanel('image'),
    FieldPanel('tags'),
    MultiFieldPanel(ContactFields.panels, "Contact"),
    InlinePanel('related_links', label="Related links"),
]

PersonPage.promote_panels = [
    MultiFieldPanel(Page.promote_panels, "Common page configuration"),
    ImageChooserPanel('feed_image'),
]
