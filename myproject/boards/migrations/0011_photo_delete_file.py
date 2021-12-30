# Generated by Django 4.0 on 2021-12-29 10:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('boards', '0010_remove_topic_file_alter_file_file'),
    ]

    operations = [
        migrations.CreateModel(
            name='Photo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50)),
                ('photo', models.FileField(upload_to='files/%Y/%m')),
                ('uploaded_at', models.DateTimeField(auto_now_add=True)),
                ('topic', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, to='boards.topic')),
            ],
        ),
        migrations.DeleteModel(
            name='File',
        ),
    ]
