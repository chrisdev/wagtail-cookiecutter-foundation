from django.db import models
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailcore.models import Page
from wagtail.wagtailadmin.edit_handlers import FieldPanel, MultiFieldPanel
from wagtail.wagtailimages.models import Image, AbstractImage, AbstractRendition
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtailsearch import index

from modelcluster.fields import ParentalKey
from modelcluster.tags import ClusterTaggableManager

from taggit.models import TaggedItemBase, Tag

class GalleryIndexPage(Page):

    """
    This is the index page for the Photo Gallery. It contains the links to Gallery pages.
    Gallery Page displays the Gallery images according to tags defined.
    """

    intro = RichTextField(blank=True)

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
    )

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
        pages = GalleryPage.objects.live().descendant_of(self)

        # Update template context
        context = super(GalleryIndexPage, self).get_context(request)
        context['pages'] = pages

        return context

    class Meta:
        verbose_name = "Gallery Index Page"


GalleryIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full")
]

GalleryIndexPage.promote_panels = [
    MultiFieldPanel(Page.promote_panels, "SEO and metadata fields"),
    ImageChooserPanel('feed_image'),
]


class GalleryPageTag(TaggedItemBase):
    content_object = ParentalKey('photo_gallery.GalleryPage', related_name='tagged_items')


class GalleryPage(Page):

    """
    This is the Gallery page. It takes tag names which you have assigned to your
    images. It gets the Image object according to tags defined by you. Your Gallery will
    be created as per tags.
    """

    tags = ClusterTaggableManager(through=GalleryPageTag, blank=True)

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
        return self.get_ancestors().type(GalleryIndexPage).last()

    def get_context(self, request):
        # Get tags and convert them into list so we can iterate over them 
        tags = self.tags.values_list('name', flat=True)

        # Creating empty Queryset from Wagtail image model
        images = Image.objects.none()

        # Populating the empty images Queryset with images of all tags in tags list.
        if tags:
            for i in range(0,len(tags)):
                img = Image.objects.filter(tags__name=tags[i])
                images = images | img
                
        
        # Pagination
        page = request.GET.get('page')
        paginator = Paginator(images, 20)  # Show 20 images per page
        try:
            images = paginator.page(page)
        except PageNotAnInteger:
            images = paginator.page(1)
        except EmptyPage:
            images = paginator.page(paginator.num_pages)


        # Update template context
        context = super(GalleryPage, self).get_context(request)
        context['images'] = images

        return context

    class Meta:
        verbose_name = "Gallery Page"

GalleryPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('tags'),
]

GalleryPage.promote_panels = [
    MultiFieldPanel(Page.promote_panels, "SEO and metadata fields"),
    ImageChooserPanel('feed_image'),
]