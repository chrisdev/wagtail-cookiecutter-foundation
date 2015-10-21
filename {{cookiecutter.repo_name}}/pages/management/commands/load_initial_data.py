import os, shutil

from django.conf import settings
from django.core.management.base import NoArgsCommand
from django.core.management import call_command


class Command(NoArgsCommand):
    def handle_noargs(self, **options):
        fixtures_dir = os.path.join(settings.PROJECT_ROOT, 'pages', 'fixtures')
        fixture_file = os.path.join(fixtures_dir, 'initial_data.json')
        image_src_dir = os.path.join(fixtures_dir, 'images')
        image_src_dir_or = os.path.join(fixtures_dir, 'original_images')
        documents_src_dir = os.path.join(fixtures_dir, 'documents')
        image_dest_dir_or = os.path.join(settings.MEDIA_ROOT, 'original_images')
        image_dest_dir = os.path.join(settings.MEDIA_ROOT, 'images')
        documents_dest_dir = os.path.join(settings.MEDIA_ROOT, 'documents')

        call_command('loaddata', fixture_file, verbosity=0)

        if not os.path.isdir(image_dest_dir):
            os.makedirs(image_dest_dir)

        for filename in os.listdir(image_src_dir):
            shutil.copy(os.path.join(image_src_dir, filename), image_dest_dir)

        if not os.path.isdir(image_dest_dir_or):
            os.makedirs(image_dest_dir_or)

        for filename in os.listdir(image_src_dir_or):
            shutil.copy(os.path.join(image_src_dir_or, filename), image_dest_dir_or)

        if not os.path.isdir(documents_dest_dir):
            os.makedirs(documents_dest_dir)

        for filename in os.listdir(documents_src_dir):
            shutil.copy(os.path.join(documents_src_dir, filename), documents_dest_dir)
