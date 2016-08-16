import os
import shutil

from django.conf import settings
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = 'Copy the media directory to project root'

    def handle(self, **options):
        media_src_dir = os.path.join(settings.PROJECT_ROOT, 'pages', 'media')
        image_src_dir = os.path.join(media_src_dir, 'images')
        image_src_dir_or = os.path.join(media_src_dir, 'original_images')
        documents_src_dir = os.path.join(media_src_dir, 'documents')
        image_dest_dir_or = os.path.join(settings.MEDIA_ROOT,
                                         'original_images')
        image_dest_dir = os.path.join(settings.MEDIA_ROOT, 'images')
        documents_dest_dir = os.path.join(settings.MEDIA_ROOT, 'documents')

        if not os.path.isdir(image_dest_dir):
            os.makedirs(image_dest_dir)

        for filename in os.listdir(image_src_dir):
            shutil.copy(os.path.join(image_src_dir, filename), image_dest_dir)

        if not os.path.isdir(image_dest_dir_or):
            os.makedirs(image_dest_dir_or)

        for filename in os.listdir(image_src_dir_or):
            shutil.copy(
                os.path.join(image_src_dir_or, filename), image_dest_dir_or
            )

        if not os.path.isdir(documents_dest_dir):
            os.makedirs(documents_dest_dir)

        for filename in os.listdir(documents_src_dir):
            shutil.copy(
                os.path.join(documents_src_dir, filename), documents_dest_dir
            )
