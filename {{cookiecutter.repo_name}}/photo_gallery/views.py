from django.shortcuts import render
from .models import CustomImage

# Create your views here.

def photo_gallery(request):

    gallery_query = request.GET.get('gallery', None)
    gallery_list = CustomImage.objects.values_list('gallery_name', flat=True).distinct()

    if gallery_query:
        images = CustomImage.objects.filter(gallery_name=gallery_query)
    else:
        images = None

    return render(request, 'photo_gallery/photo_gallery.html', {
        'gallery_query': gallery_query,
        'gallery_list' : gallery_list,
        'gallery_images': images,
        })