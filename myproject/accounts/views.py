from django.contrib import messages
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.generic import UpdateView, CreateView

from .forms import SignupReaderForm, SignupBloggerForm


# def signup(request):
#     if request.method == 'POST':
#         form = SignupForm(request.POST)
#         if form.is_valid():
#             user = form.save()
#             login(request, user)
#             return redirect('home')
#     else:
#         form = SignupForm()
#     return render(request, 'accounts/signup_users.html', {'form': form})


def signup(request):
    return render(request, 'accounts/signup.html')


class ReaderSignup(CreateView):
    model = User
    form_class = SignupReaderForm
    template_name = 'accounts/signup_users.html'

    def get_context_data(self, **kwargs):
        kwargs['user_type'] = 'Reader'
        return super().get_context_data(**kwargs)

    def form_valid(self, form):
        user = form.save()
        login(self.request, user)
        return redirect('home')


class BloggerSignup(CreateView):
    model = User
    form_class = SignupBloggerForm
    template_name = 'accounts/signup_users.html'

    def get_context_data(self, **kwargs):
        kwargs['user_type'] = 'Blogger'
        return super().get_context_data(**kwargs)

    def form_valid(self, form):
        user = form.save()
        login(self.request, user)
        return redirect('home')


#for displaying messages you can also use build-in Django SuccessMessageMixin
@method_decorator(login_required, name='dispatch')
class UserUpdateView(UpdateView):
    model = User
    template_name = 'accounts/my_account.html'
    success_url = reverse_lazy('home')
    fields = ['first_name', 'last_name', 'email']

    def get_object(self, queryset=None):
        return self.request.user

    def form_valid(self, form):
        messages.success(self.request, "Your account information was updated successfully")
        return super().form_valid(form)

    def form_invalid(self, form):
        messages.error(self.request, "Something went wrong. Try again")
        return super().form_invalid(form)