from django.contrib import admin
from .models import Board, Topic, Post


class BoardAdmin(admin.ModelAdmin):
    list_display = ['name', 'pk']
    list_display_links = ['name', 'pk']


class TopicAdmin(admin.ModelAdmin):
    list_display = ['subject', 'pk']
    list_display_links = ['subject', 'pk']


admin.site.register(Board)
admin.site.register(Topic, TopicAdmin)
admin.site.register(Post)
