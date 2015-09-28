import os
import re
import shutil
import unittest
from os.path import exists, dirname, join

import sh

from cookiecutter.main import cookiecutter


class DjangoCookieTestCase(unittest.TestCase):

    root_dir = dirname(dirname(__file__))
    ctx = {}
    destpath = None

    def check_paths(self, paths):
        """
        Method to check all paths have correct substitutions,
        used by other tests cases
        """
        # Construct the cookiecutter search pattern
        pattern = "{{(\s?cookiecutter)[.](.*?)}}"
        re_obj = re.compile(pattern)

        # Assert that no match is found in any of the files
        for path in paths:
            for line in open(path, 'r'):
                match = re_obj.search(line)
                self.assertIsNone(
                    match,
                    "cookiecutter variable not replaced in {}".format(path))

    def generate_project(self, extra_context=None):
        ctx = {
            "project_name": "Wagtail Project",
            "repo_name": "wagtail_project",
            "version_control_system": "hg",
            "author_name": "Your Name",
            "email": "Your email",
            "description": "A short description of the project.",
            "timezone": "UTC",
            "now": "2015/04/16",
            "year": "2015",
            "production_host_name" : "example.org",
            "use_ssl_in_production": "true",
            "staging_host_name": "staging.example.org",
            "use_vagrant_staging": "true"
        }

        if extra_context:
            assert isinstance(extra_context, dict)
            ctx.update(extra_context)

        self.ctx = ctx
        self.destpath = join(self.root_dir, self.ctx['repo_name'])

        cookiecutter(template='./', checkout=None, no_input=True, extra_context=ctx)

        # Build a list containing absolute paths to the generated files
        paths = [os.path.join(dirpath, file_path)
                 for dirpath, subdirs, files in os.walk(self.destpath)
                 for file_path in files]
        return paths

    def clean(self):
        if exists(self.destpath):
            shutil.rmtree(self.destpath)
        sh.cd(self.root_dir)

    def tearDown(self):
        self.clean()
