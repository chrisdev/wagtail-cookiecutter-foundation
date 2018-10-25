from django.db import models
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from wagtail.core.fields import RichTextField
from wagtail.core.models import Page
from wagtail.admin.edit_handlers import FieldPanel, MultiFieldPanel
from wagtail.documents.models import Document
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.search import index

from modelcluster.fields import ParentalKey
from modelcluster.tags import ClusterTaggableManager

from taggit.models import TaggedItemBase


class DocumentsIndexPage(Page):

    """
    This is the index page for the Documents Gallery. It contains the links to
    Gallery pages.  Gallery Page displays the gallery documents according to
    tags defined.
    """

    intro = RichTextField(blank=True)

    search_fields = Page.search_fields + [
        index.SearchField('intro'),
    ]

    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    @property
    def children(self):
        return self.get_children().live()

    def get_context(self, request):
        # Get list of live Gallery pages that are descendants of this page
        pages = DocumentsPage.objects.live().descendant_of(self)

        # Update template context
        context = super(DocumentsIndexPage, self).get_context(request)
        context['pages'] = pages

        return context

    class Meta:
        verbose_name = "Documents Index Page"


DocumentsIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full")
]

DocumentsIndexPage.promote_panels = [
    MultiFieldPanel(Page.promote_panels, "SEO and metadata fields"),
    ImageChooserPanel('feed_image'),
]


class DocumentsPageTag(TaggedItemBase):
    content_object = ParentalKey(
        'documents_gallery.DocumentsPage', related_name='tagged_items')


class DocumentsPage(Page):

    """
    This is the Documents page. It takes tag names which you have assigned to
    your documents. It gets the document objects according to tags defined by
    you. Your document gallery will be created as per tags.
    """

    tags = ClusterTaggableManager(through=DocumentsPageTag, blank=True)

    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    @property
    def gallery_index(self):
        # Find closest ancestor which is a Gallery index
        return self.get_ancestors().type(DocumentsIndexPage).last()

    def get_context(self, request):
        # Get tags and convert them into list so we can iterate over them
        tags = self.tags.values_list('name', flat=True)

        # Creating empty Queryset from Wagtail Document model
        documents = Document.objects.none()

        if tags:
            len_tags = len(tags)
            for i in range(0, len_tags):
                doc = Document.objects.filter(tags__name=tags[i])
                documents = documents | doc

        # Pagination
        page = request.GET.get('page')
        paginator = Paginator(documents, 25)  # Show 25 documents per page
        try:
            documents = paginator.page(page)
        except PageNotAnInteger:
            documents = paginator.page(1)
        except EmptyPage:
            documents = paginator.page(paginator.num_pages)

        # Update template context
        context = super(DocumentsPage, self).get_context(request)
        context['documents'] = documents

        return context

    class Meta:
        verbose_name = "Documents Page"


DocumentsPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('tags'),
]

DocumentsPage.promote_panels = [
    MultiFieldPanel(Page.promote_panels, "SEO and metadata fields"),
    ImageChooserPanel('feed_image'),
]
