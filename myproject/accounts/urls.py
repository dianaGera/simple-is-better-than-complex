from django.urls import path
from django.contrib.auth import views as auth_views
from accounts import views

urlpatterns = [
    path('signup/', views.signup, name='signup'),
    path('signup/reader/', views.ReaderSignup.as_view(), name='signup_reader'),
    path('signup/blogger/', views.BloggerSignup.as_view(), name='signup_blogger'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('login/', auth_views.LoginView.as_view(template_name='accounts/login.html'), name='login'),
]