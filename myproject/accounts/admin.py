from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .models import Blogger, Reader, User


class BloggerAdmin(admin.ModelAdmin):
    list_display = ['user', 'birthday']


class ReaderAdmin(admin.ModelAdmin):
    list_display = ['user']


class ProfileInline(admin.StackedInline):
    model = Blogger
    can_delete = False
    verbose_name = 'Profile'
    fk_name = 'user'


class CustomUserAdmin(UserAdmin):
    inlines = (ProfileInline, )
    list_display = ('username', 'email', 'is_blogger', 'first_name', 'last_name', 'get_location')
    list_select_related = ('blogger', 'reader')
    list_filter = ('is_blogger',)

    def get_location(self, instance):
        return instance.blogger.country
    get_location.short_description = 'country'

    def get_inline_instances(self, request, obj=None):
        if not obj:
            return list()
        return super(CustomUserAdmin, self).get_inline_instances(request, obj)


admin.site.register(Blogger, BloggerAdmin)
admin.site.register(Reader, ReaderAdmin)
admin.site.register(User, CustomUserAdmin)