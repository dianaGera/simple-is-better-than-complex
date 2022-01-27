from PIL import Image
from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.db import transaction
from django.forms import SelectDateWidget
from django.contrib.auth import get_user_model
from django.core.validators import MinValueValidator, MaxValueValidator
from .models import Reader, Category, Interests, Blogger
from datetime import datetime
from snowpenguin.django.recaptcha2.fields import ReCaptchaField
from snowpenguin.django.recaptcha2.widgets import ReCaptchaWidget
from django_countries.widgets import CountrySelectWidget
from django_countries.data import COUNTRIES

User = get_user_model()


class LoginForm(AuthenticationForm):
    captcha = ReCaptchaField(widget=ReCaptchaWidget())

    class Meta:
        model = User
        fields = ['username', 'password', 'captcha']


class SignupBloggerForm(UserCreationForm):
    category = forms.ModelMultipleChoiceField(
        queryset=Category.objects.all(),
        required=True,
        widget=forms.CheckboxSelectMultiple(attrs={'class': 'p-1'}))
    birthday = forms.DateField(widget=SelectDateWidget(
        years=range(1960, datetime.now().year+1)),
        initial=datetime.now())
    country = forms.ChoiceField(choices=COUNTRIES.items)
    email = forms.EmailField()
    captcha = ReCaptchaField(widget=ReCaptchaWidget())

    class Meta(UserCreationForm.Meta):
        model = User

    @transaction.atomic
    def save(self):
        user = super().save(commit=False)
        user.is_blogger = True
        user.email = self.cleaned_data.get('email')
        user.save()
        blogger = Blogger.objects.create(
            user=user,
            country=self.cleaned_data.get('country'),
            birthday=self.cleaned_data.get('birthday')
        )
        blogger.category.add(*self.cleaned_data.get('category'))
        blogger.email = self.cleaned_data.get('email')
        return user


class SignupReaderForm(UserCreationForm):
    interests = forms.ModelMultipleChoiceField(
        queryset=Interests.objects.all(),
        widget=forms.CheckboxSelectMultiple,
        required=True
    )
    email = forms.EmailField()
    is_adult = forms.BooleanField(required=False, initial=False)
    captcha = ReCaptchaField(widget=ReCaptchaWidget())

    class Meta(UserCreationForm.Meta):
        model = User
        widget = {
            'interests': forms.CheckboxSelectMultiple()
        }

    @transaction.atomic
    def save(self):
        user = super().save(commit=False)
        user.is_reader = True
        user.email = self.cleaned_data.get('email')
        user.save()
        reader = Reader.objects.create(user=user)
        reader.interests.add(*self.cleaned_data.get('interests'))
        reader.is_adult = self.cleaned_data.get('is_adult')
        return user


class GenerateRandomUserForm(forms.Form):
    total = forms.IntegerField(
        validators=[
            MinValueValidator(1),
            MaxValueValidator(500)
        ]
    )


class UserForm(forms.ModelForm):
    x = forms.FloatField(widget=forms.HiddenInput, required=False)
    y = forms.FloatField(widget=forms.HiddenInput, required=False)
    width = forms.FloatField(widget=forms.HiddenInput, required=False)
    height = forms.FloatField(widget=forms.HiddenInput, required=False)

    class Meta:
        model = User
        fields = ['file', 'username', 'first_name', 'last_name', 'email', 'x', 'y', 'width', 'height', ]
        widgets = {
            'file': forms.FileInput(attrs={
                'accept': 'image/*'
            })
        }

        def save(self):
            avatar = super(UserForm, self).save()

            x = self.cleaned_data.get('x')
            y = self.cleaned_data.get('y')
            w = self.cleaned_data.get('width')
            h = self.cleaned_data.get('height')

            image = Image.open(avatar.file)
            cropped_image = image.crop((x, y, w+x, h+y))
            resized_image = cropped_image.resize((200, 200), Image.ANTIALIAS)
            resized_image.save(avatar.file.path)

            return avatar