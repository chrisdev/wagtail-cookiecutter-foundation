from django.apps import AppConfig


class GalleryConfig(AppConfig):
    name = 'gallery'
    verbose_name = "Gallery"
    verbose_name_plural = "Galleries"

    def ready(self):
        import gallery.wagtail_hooks
