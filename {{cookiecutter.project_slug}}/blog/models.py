from django.db import models
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.template.response import TemplateResponse
from django.utils.safestring import mark_safe

from wagtail.core import blocks
from wagtail.core.models import Page, Orderable
from wagtail.core.fields import RichTextField, StreamField
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.images.blocks import ImageChooserBlock

from wagtail.search import index
from wagtail.contrib.routable_page.models import RoutablePageMixin, route

from wagtail.admin.edit_handlers import (
    FieldPanel, InlinePanel, StreamFieldPanel, MultiFieldPanel,
)
from modelcluster.fields import ParentalKey
from modelcluster.tags import ClusterTaggableManager
from taggit.models import TaggedItemBase
from bs4 import BeautifulSoup
from utils.models import RelatedLink, CarouselItem


class BlogIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('blog.BlogIndexPage', related_name='related_links')


class BlogIndexPage(Page):
    intro = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    search_fields = Page.search_fields + [
        index.SearchField('intro'),
    ]

    @property
    def blogs(self):
        # Get list of live blog pages that are descendants of this page
        blogs = BlogPage.objects.live().descendant_of(self)

        # Order by most recent date first
        blogs = blogs.order_by('-date')

        return blogs

    def get_context(self, request):
        # Get blogs
        blogs = self.blogs

        # Filter by tag
        tag = request.GET.get('tag')
        if tag:
            blogs = blogs.filter(tags__name=tag)

        # Pagination
        page = request.GET.get('page')
        paginator = Paginator(blogs, 10)  # Show 10 blogs per page
        try:
            blogs = paginator.page(page)
        except PageNotAnInteger:
            blogs = paginator.page(1)
        except EmptyPage:
            blogs = paginator.page(paginator.num_pages)

        # Update template context
        context = super(BlogIndexPage, self).get_context(request)
        context['blogs'] = blogs
        return context


BlogIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel('related_links', label="Related links"),
]


BlogIndexPage.promote_panels = [
    MultiFieldPanel(Page.promote_panels, "Common page configuration"),
    ImageChooserPanel('feed_image'),
]


# Blog page

class BlogPageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('blog.BlogPage', related_name='carousel_items')


class BlogPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('blog.BlogPage', related_name='related_links')


class BlogPageTag(TaggedItemBase):
    content_object = ParentalKey('blog.BlogPage', related_name='tagged_items')


class BlogPage(RoutablePageMixin, Page):
    intro = RichTextField()
    body = StreamField([
        ('paragraph', blocks.RichTextBlock()),
        ('image', ImageChooserBlock()),
        ('html', blocks.RawHTMLBlock()),
    ])
    tags = ClusterTaggableManager(through=BlogPageTag, blank=True)
    date = models.DateField("Post date")
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + [
        index.SearchField('body'),
    ]

    parent_page_types = ['blog.BlogIndexPage']

    @property
    def blog_index(self):
        # Find closest ancestor which is a blog index
        return self.get_ancestors().type(BlogIndexPage).last()

    @route(r'^$')
    def normal_page(self, request):
        return Page.serve(self, request)

    @route(r'^amp/$')
    def amp(self, request):
        context = self.get_context(request)
        body_html = self.body.__html__()
        soup = BeautifulSoup(body_html, 'html.parser')
        # Remove style attribute to remove large bottom padding
        for div in soup.find_all("div", {'class': 'responsive-object'}):
            del div['style']

        # Change img tags to amp-img
        for img_tag in soup.findAll('img'):
            img_tag.name = 'amp-img'
            img_tag.append(BeautifulSoup('</amp-img>', 'html.parser'))
            img_tag['layout'] = 'responsive'

        # Change iframe tags to amp-iframe
        for iframe in soup.findAll('iframe'):
            iframe.name = 'amp-iframe'
            iframe['sandbox'] = 'allow-scripts allow-same-origin'
            iframe['layout'] = 'responsive'

        context['body_html'] = mark_safe(soup.prettify(formatter="html"))
        context['is_amp'] = True
        context['base_template'] = 'amp_base.html'
        response = TemplateResponse(
            request, 'blog/blog_page_amp.html', context
        )
        return response


BlogPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('date'),
    FieldPanel('intro', classname="full"),
    StreamFieldPanel('body'),
    InlinePanel('carousel_items', label="Carousel items"),
    InlinePanel('related_links', label="Related links"),
]

BlogPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
    FieldPanel('tags'),
]
