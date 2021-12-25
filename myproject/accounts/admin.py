from django.contrib import admin
from .models import Blogger, Reader, User, Category, Interests


class BloggerAdmin(admin.ModelAdmin):
    list_display = ['user', 'birthday']


class ReaderAdmin(admin.ModelAdmin):
    list_display = ['user']


class CategoryAdmin(admin.ModelAdmin):
    list_display = ['id', 'category']


class InterestsAdmin(admin.ModelAdmin):
    list_display = ['id', 'interests']


admin.site.register(Blogger, BloggerAdmin)
admin.site.register(Reader, ReaderAdmin)
admin.site.register(User)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Interests, InterestsAdmin)