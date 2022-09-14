from django.contrib import messages
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.generic import UpdateView, CreateView, FormView
from .forms import SignupReaderForm, SignupBloggerForm, GenerateRandomUserForm, UserForm
from myproject.tasks import create_random_user_accounts, send_email
from .models import User


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
        login(self.request, user, 'django.contrib.auth.backends.ModelBackend')
        subject = f'Hello {self.request.user}!'
        message = 'Congratulations on your successful registration as a Reader on our website'
        recipient_list = [self.request.user.email]
        send_email.delay(subject, message, recipient_list)
        messages.success(self.request, message)
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
        login(self.request, user, 'django.contrib.auth.backends.ModelBackend')
        subject = f'Hello {self.request.user}!'
        message = 'Congratulations on your successful registration as a Blogger on our website'
        recipient_list = [self.request.user.email]
        send_email.delay(subject, message, recipient_list)
        messages.success(self.request, message)
        return redirect('home')


#for displaying messages you can also use build-in Django SuccessMessageMixin
@method_decorator(login_required, name='dispatch')
class UserUpdateView(UpdateView):
    model = User
    form_class = UserForm
    template_name = 'accounts/photo_list.html'
    success_url = reverse_lazy('home')

    def get_object(self, queryset=None):
        return self.request.user

    def form_valid(self, form):
        subject = f'Hello {self.request.user}!'
        message = f'{self.request.user}, your account information was updated successfully'
        recipient_list = [self.request.user.email]
        send_email.delay(subject, message, recipient_list)
        messages.success(self.request, message)
        return super().form_valid(form)

    def form_invalid(self, form):
        messages.error(self.request, "Something went wrong. Try again")
        return super().form_invalid(form)

    # def get_success_url(self):
    #     if self.request.user.is_blogger:
    #         return reverse_lazy('blogger_home')
    #     return reverse_lazy('home')


# def photo_list(request):
#     avatars = Avatar.objects.all()
#     if request.method == 'POST':
#         form = AvatarForm(request.POST, request.FILES)
#         if form.is_valid():
#             form.save()
#             return redirect('home')
#     else:
#         form = AvatarForm()
#     return render(request, 'accounts/photo_list.html', {'form': form, 'photos': avatars})


class GenerateRandomUserView(FormView):
    template_name = 'accounts/admin_page.html'
    form_class = GenerateRandomUserForm

    def form_valid(self, form):
        total = form.cleaned_data.get('total')
        create_random_user_accounts.delay(total)
        messages.success(self.request, 'We are generating your random users! Wait a moment and refresh this page.')
        return redirect('home')