# Generated by Django 3.1 on 2020-09-05 03:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('testapp', '0004_auto_20200905_1054'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pony',
            name='ability',
            field=models.CharField(max_length=20),
        ),
    ]
