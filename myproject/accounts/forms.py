from PIL import Image
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.db import transaction
from django.forms import SelectDateWidget
from django.contrib.auth import get_user_model
from .models import Reader, Category, Interests, Blogger
from datetime import datetime
from django.core.validators import MinValueValidator, MaxValueValidator

User = get_user_model()


class SignupBloggerForm(UserCreationForm):
    category = forms.ModelMultipleChoiceField(
        queryset=Category.objects.all(),
        required=True,
        widget=forms.CheckboxSelectMultiple(attrs={'class': 'p-1'}))
    birthday = forms.DateField(widget=SelectDateWidget(
            years=range(1960, datetime.now().year+1)),
        initial=datetime.now())
    country = forms.CharField(max_length=50, widget=forms.TextInput())

    class Meta(UserCreationForm.Meta):
        model = User
        widget = {
            'category': forms.CheckboxSelectMultiple()
        }

    @transaction.atomic
    def save(self):
        user = super().save(commit=False)
        user.is_blogger = True
        user.save()
        blogger = Blogger.objects.create(
            user=user,
            country=self.cleaned_data.get('country'),
            birthday=self.cleaned_data.get('birthday')
        )
        blogger.category.add(*self.cleaned_data.get('category'))
        return user


class SignupReaderForm(UserCreationForm):
    interests = forms.ModelMultipleChoiceField(
        queryset=Interests.objects.all(),
        widget=forms.CheckboxSelectMultiple,
        required=True
    )
    is_adult = forms.BooleanField(required=False, initial=False)

    class Meta(UserCreationForm.Meta):
        model = User

    @transaction.atomic
    def save(self):
        user = super().save(commit=False)
        user.is_reader = True
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