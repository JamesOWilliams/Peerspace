# Generated by Django 2.0 on 2018-01-02 12:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('notifications', '0004_notification_post'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notification',
            name='post',
            field=models.ForeignKey(on_delete=None, related_name='post', to='posts.Post'),
        ),
    ]