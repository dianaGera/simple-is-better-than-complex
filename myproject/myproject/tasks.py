import string
from django.utils.crypto import get_random_string
from django.core.mail import send_mail
from accounts.models import User
from celery import shared_task


@shared_task
def create_random_user_accounts(total):
    for i in range(total):
        username = 'user_{}'.format(get_random_string(10, string.ascii_letters))
        email = '{}@example.com'.format(username)
        password = get_random_string(50)
        User.objects.create(username=username, email=email, password=password)
    return '{} random users created with success!'.format(total)


@shared_task
def send_email(subject, message, recipient_list):
    from_email = 'djangoproject64@gmail.com'
    return send_mail(subject, message, from_email, recipient_list, fail_silently=False)
