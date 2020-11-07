from django.db import models

# Create your models here.
class Comment(models.Model):
    content = models.CharField(max_length=200)
    author = models.CharField(max_length=20)
    date = models.DateTimeField()