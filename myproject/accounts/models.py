from django.contrib.auth.models import AbstractUser
from django.db import models
from django_countries.fields import CountryField


class Category(models.Model):
    category = models.CharField(max_length=30)

    class Meta:
        ordering = ['category']

    def __str__(self):
        return self.category


class Interests(models.Model):
    interests = models.CharField(max_length=30)

    class Meta:
        ordering = ['interests']

    def __str__(self):
        return self.interests


#Extending User Model Using a Custom Model Extending AbstractUser
class User(AbstractUser):
    is_blogger = models.BooleanField(default=False)
    is_reader = models.BooleanField(default=False)
    file = models.FileField(upload_to='avatar/', null=True, blank=True)


class Blogger(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, unique=True)
    birthday = models.DateField()
    country = CountryField()
    category = models.ManyToManyField(Category)

    class Meta:
        ordering = ['user']

        def __str__(self):
            return self.user


class Reader(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, unique=True)
    is_adult = models.BooleanField(default=False)
    interests = models.ManyToManyField(Interests)

    class Meta:
        ordering = ['user']

        def __str__(self):
            return self.user
