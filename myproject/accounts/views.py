from django.contrib.auth import login
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic import UpdateView

from .forms import SignupForm


def signup(request):
    if request.method == 'POST':
        form = SignupForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('home')
    else:
        form = SignupForm()
    return render(request, 'signup.html', {'form': form})


class UserUpdateView(UpdateView):
    model = User
    template_name = 'my_account.html'
    success_url = reverse_lazy('my_account')
    fields = ['first_name', 'last_name', 'email']

    def get_object(self, queryset=None):
        return self.request.user
