# Generated by Django 3.1 on 2020-09-13 07:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SchoolApp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='gender',
            field=models.CharField(max_length=2),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='gender',
            field=models.CharField(max_length=2),
        ),
    ]
