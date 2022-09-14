from django.db.models.signals import post_save
from django.contrib.auth.models import User
from django.dispatch import receiver
from myproject.tasks import send_email


@receiver(post_save, sender=User)
def create_post(sender, instance, created, **kwargs):
    if created:
        subject = f'Hello {instance.topic.starter}!'
        message = f'User {instance.created_by} posted something in your {instance.topic} topic'
        recipient_list = [instance.topic.starter.email]
        send_email.delay(subject, message, recipient_list)
