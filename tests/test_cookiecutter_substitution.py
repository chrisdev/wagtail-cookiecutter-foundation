from __future__ import absolute_import


from .base import DjangoCookieTestCase


class TestCookiecutterSubstitution(DjangoCookieTestCase):
    """Test that all cookiecutter instances are substituted"""

    def test_default_configuration(self):
        # Build a list containing absolute paths to the generated files
        paths = self.generate_project()
        self.check_paths(paths)
