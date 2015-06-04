from django import template
from contact.models import ContactPage

register = template.Library()


@register.assignment_tag(takes_context=True)
def get_contact_fields(context):
    try:
        contact_vals = ContactPage.objects.values(
            'name_organization', 'address_1',
            'address_2', 'city', 'country', 'telephone'
        )[0]
        return contact_vals

    except IndexError:
        return {}
