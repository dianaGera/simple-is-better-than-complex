from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from graphene_django.views import GraphQLView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('accounts.urls')),
    path('pages/', include('django.contrib.flatpages.urls')),
    path("accounts/", include("allauth.urls")),
    path('', include('boards.urls')),
    path('__debug__/', include('debug_toolbar.urls')),
    path('graphene/', GraphQLView.as_view(qraphql=True))
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)