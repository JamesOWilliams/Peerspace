# Generated by Django 2.0 on 2017-12-29 14:50

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('posts', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='deadline',
            field=models.DateTimeField(blank=True, default=django.utils.timezone.now),
        ),
    ]
