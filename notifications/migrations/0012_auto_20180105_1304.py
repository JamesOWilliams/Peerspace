# Generated by Django 2.0.1 on 2018-01-05 13:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('notifications', '0011_auto_20180105_0942'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notification',
            name='post',
            field=models.ForeignKey(default=None, null=True, on_delete=None, related_name='post', to='posts.Post'),
        ),
    ]