from django.contrib import admin
from .models import Board, Topic, Post, Photo


def deactivate(modeladmin, request, queryset):
    for board in queryset:
        board.is_active = False
        board.save()


def activate(modeladmin, request, queryset):
    for board in queryset:
        board.is_active = True
        board.save()


deactivate.short_description = 'Deactivate selected fields'
activate.short_description = 'Activate selected fields'


class BoardAdmin(admin.ModelAdmin):
    list_display = ['pk', 'name', 'is_active']
    list_display_links = ['name', 'pk']
    list_editable = ['is_active']
    list_filter = ['is_active']
    actions = [deactivate, activate]


class TopicAdmin(admin.ModelAdmin):
    list_display = ['pk', 'subject', 'views', 'board', 'starter', 'last_updated']
    list_display_links = ['subject', 'pk', 'board', 'starter']
    list_filter = ['views', 'starter', 'board']



class PostAdmin(admin.ModelAdmin):
    list_display = ['pk', 'message', 'topic', 'created_by', 'created_at', ]
    list_display_links = ['topic', 'pk', 'topic', 'created_by']
    list_filter = ['created_by', 'created_at', 'topic']


class PhotoAdmin(admin.ModelAdmin):
    list_display = ['title', 'topic', 'file', 'uploaded_at']


admin.site.register(Board, BoardAdmin)
admin.site.register(Topic, TopicAdmin)
admin.site.register(Post, PostAdmin)
admin.site.register(Photo, PhotoAdmin)
