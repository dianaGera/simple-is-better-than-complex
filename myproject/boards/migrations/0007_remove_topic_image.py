# Generated by Django 4.0 on 2021-12-28 17:35

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('boards', '0006_remove_post_image_topic_image'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='topic',
            name='image',
        ),
    ]
