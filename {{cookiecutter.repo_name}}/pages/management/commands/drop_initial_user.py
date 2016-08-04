from django.core.management.base import NoArgsCommand
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist


class Command(NoArgsCommand):
    def handle_noargs(self, **options):
        try:
            User.objects.get(username='admin').delete()
        except ObjectDoesNotExist:
            print "Already Removed"
