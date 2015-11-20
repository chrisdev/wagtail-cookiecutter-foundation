from __future__ import absolute_import
import sh
import os
from .base import DjangoCookieTestCase


class TestCookiecutterDjango(DjangoCookieTestCase):

    # Tests makefile exists and make virtualenv
    def test_virtualenv_install(self):
        self.generate_project()
        try:
            os.chdir("wagtail_project")
            make_cmd = sh.Command("make")
            make_cmd("virtualenv")
        except sh.ErrorReturnCode as e:
            raise AssertionError(e)
