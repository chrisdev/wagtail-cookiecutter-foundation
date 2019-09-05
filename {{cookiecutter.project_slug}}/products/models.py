from django.db import models
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from wagtail.core.models import Page, Orderable
from wagtail.core.fields import RichTextField
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.images.models import Image


from wagtail.admin.edit_handlers import (
    FieldPanel, MultiFieldPanel, InlinePanel
)
from modelcluster.fields import ParentalKey
from modelcluster.tags import ClusterTaggableManager
from taggit.models import Tag, TaggedItemBase
from utils.models import RelatedLink


# Product page
class ProductIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey(
        'products.ProductIndexPage', related_name='related_links'
    )


class ProductIndexPage(Page):
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
    def products(self):
        # Get list of live blog pages that are descendants of this page
        products = ProductPage.objects.live().descendant_of(self)

        return products

    @property
    def tag_list(self):
        tag_ids = ProductPageTag.objects.all().values_list('tag_id', flat=True)
        return Tag.objects.filter(pk__in=tag_ids)

    def get_context(self, request):
        # Get products
        products = self.products
        # Filter by tag
        tag = request.GET.get('tag')
        if tag:
            products = products.filter(tags__name=tag)

        # Pagination
        page = request.GET.get('page')
        paginator = Paginator(products, 12)  # Show 10 products per page
        try:
            products = paginator.page(page)
        except PageNotAnInteger:
            products = paginator.page(1)
        except EmptyPage:
            products = paginator.page(paginator.num_pages)

        # Update template context
        context = super(ProductIndexPage, self).get_context(request)
        context['products'] = products
        return context


ProductIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('subtitle'),
    FieldPanel('intro', classname="full"),
    InlinePanel('related_links', label="Related links"),
]


ProductIndexPage.promote_panels = [
    MultiFieldPanel(Page.promote_panels, "Common page configuration"),
    ImageChooserPanel('feed_image'),
]


class ProductPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('products.ProductPage', related_name='related_links')


class ProductPageTag(TaggedItemBase):
    content_object = ParentalKey(
        'products.ProductPage', related_name='tagged_items'
    )

    def __unicode__(self):
        return self.name


class ProductPage(Page):
    price = models.CharField(max_length=255, blank=True)
    description = RichTextField(blank=True)
    intro = models.CharField(max_length=255, blank=True)
    link_demo = models.URLField("Demo link", blank=True)
    tags = ClusterTaggableManager(through=ProductPageTag, blank=True)
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


ProductPage.content_panels = [
    FieldPanel('title', classname="title"),
    FieldPanel('intro', classname="full"),
    FieldPanel('price', classname="full"),
    FieldPanel('description', classname="full"),
    ImageChooserPanel('image'),
    FieldPanel('link_demo'),
    FieldPanel('tags'),
    InlinePanel('related_links', label="Related links"),
]

ProductPage.promote_panels = [
    MultiFieldPanel(Page.promote_panels, "Common page configuration"),
    ImageChooserPanel('feed_image'),
]
