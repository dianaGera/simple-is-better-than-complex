from django.urls import path
from boards import views

urlpatterns = [
    path('', views.home, name='home'),
    # path('', views.BoardListView.as_view(), name='home'),
    path('blogger_home/', views.blogger_home, name='blogger_home'),
    # path('boards/<int:board_id>/', views.board_topics, name='board_topics'),
    path('boards/<int:board_id>/', views.TopicListView.as_view(), name='board_topics'),
    path('boards/create/', views.create_boards, name='create_boards'),
    path('boards/<int:board_id>/update/', views.update_boards, name='update_boards'),
    path('boards/<int:board_id>/delete/', views.delete_boards, name='delete_boards'),
    path('boards/<int:board_id>/new/', views.New_topicView.as_view(), name='new_topic'),
    # path('boards/<int:board_id>/topics/<int:topic_id>/', views.topic_posts, name='topic_posts'),
    path('boards/<int:board_id>/topics/<int:topic_id>/',
         views.PostListView.as_view(),
         name='topic_posts'),
    path('boards/<int:board_id>/topics/<int:topic_id>/reply/',
         views.reply_topic,
         name='reply_topic'),
    path('new_post/', views.NewPostView.as_view(), name='new_post'),
    path('boards/<int:board_id>/topics/<int:topic_id>/posts/<post_pk>/edit/',
         views.PostUpdateView.as_view(),
         name='edit_post'),
    path('export/csv/<int:board_id>', views.export_boards_csv, name='export_boards_csv'),
    path('export/xls/<int:board_id>', views.export_boards_xls, name='export_boards_xls'),
    path('export/pdf/<int:board_id>', views.export_boards_pdf, name='export_boards_pdf'),
]