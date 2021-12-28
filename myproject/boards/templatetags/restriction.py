from django import template
from django.shortcuts import render

register = template.Library()


def is_blogger(func):
    def _view(request, *args, **kwargs):
        res = func(request, *args, **kwargs)
        if not request.user.is_blogger:
            return render('login')
        return res
    return _view
