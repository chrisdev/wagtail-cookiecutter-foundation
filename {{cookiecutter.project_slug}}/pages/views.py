# Create your views here.

from django.shortcuts import render

def error_500(request):
    return render(request, '500.html')

def check():
    pass
