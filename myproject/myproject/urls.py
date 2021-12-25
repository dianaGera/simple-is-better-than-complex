from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.auth import views as auth_views
# from django.http import request
from django.urls import path, include
from boards import views
from accounts import views as accounts_view

urlpatterns = [
    path('test/<int:board_id>/', views.test, name='test'),
    # path('', views.home, name='home'),
    path('', views.BoardListView.as_view(), name='home'),
    # path('signup/', accounts_view.signup, name='signup'),
    # path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    # path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    # path('boards/<int:board_id>/', views.board_topics, name='board_topics'),
    path('boards/create/', views.create_boards, name='create_boards'),
    path('boards/<int:board_id>/update/', views.update_boards, name='update_boards'),
    path('boards/<int:board_id>/delete/', views.delete_boards, name='delete_boards'),
    path('boards/<int:board_id>/', views.TopicListView.as_view(), name='board_topics'),
    # path('boards/<int:board_id>/topics/<int:topic_id>/', views.topic_posts, name='topic_posts'),
    path('boards/<int:board_id>/topics/<int:topic_id>/', views.PostListView.as_view(), name='topic_posts'),
    path('boards/<int:board_id>/topics/<int:topic_id>/reply/', views.reply_topic, name='reply_topic'),
    path('boards/<int:board_id>/new/', views.new_topic, name='new_topic'),
    path('admin/', admin.site.urls),
    path('reset/', auth_views.PasswordResetView.as_view(
            template_name='accounts/password_reset.html',
            email_template_name='accounts/password_reset_email.html',
            subject_template_name='accounts/password_reset_subject.txt'), name='password_reset'),
    path('reset/done/', auth_views.PasswordResetDoneView.as_view(template_name='accounts/password_reset_done.html'),
         name='password_reset_done'),
    path('reset/(<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(
        template_name='accounts/password_reset_confirm.html'), name='password_reset_confirm'),
    path('reset/complete/', auth_views.PasswordResetCompleteView.as_view(
        template_name='accounts/password_reset_complete.html'), name='password_reset_complete'),
    path('settings/password/', auth_views.PasswordChangeView.as_view(template_name='accounts/password_change.html'),
        name='password_change'),
    path('settings/password/done/', auth_views.PasswordChangeDoneView.as_view(
        template_name='accounts/password_change_done.html'), name='password_change_done'),
    path('new_post/', views.NewPostView.as_view(), name='new_post'),
    path('boards/<int:board_id>/topics/<int:topic_id>/posts/<post_pk>/edit/',
         views.PostUpdateView.as_view(), name='edit_post'),
    path('settings/account/', accounts_view.UserUpdateView.as_view(), name='my_account'),
    path('accounts/', include('accounts.urls')),
    path('pages/', include('django.contrib.flatpages.urls'))
]
# if HttpRequest.user.is_blogger:
#     urlpatterns += [
#         path('boards/create/', views.create_boards, name='create_boards'),
#         path('boards/<int:board_id>/update/', views.update_boards, name='update_boards'),
#         path('boards/<int:board_id>/delete/', views.delete_boards, name='delete_boards'),
#     ]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.STATIC_ROOT)