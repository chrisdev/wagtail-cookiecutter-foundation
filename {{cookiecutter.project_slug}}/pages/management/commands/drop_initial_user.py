from django.core.management.base import BaseCommand
from django.contrib.auth.models import User as AuthUser
from django.core.exceptions import ObjectDoesNotExist


class Command(BaseCommand):
    def handle(self, **options):
        try:
            AuthUser.objects.get(username='admin').delete()
        except ObjectDoesNotExist:
            print("Already Removed")
        # hack to work with custom user.User rather the auth.User
        except AttributeError:
            from users.models import User as UserUser
            UserUser.objects.get(username='admin').delete()
