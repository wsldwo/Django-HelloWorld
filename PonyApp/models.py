from django.db import models

# Create your models here.
class Pony(models.Model):
    name = models.CharField(max_length=20)
    age = models.IntegerField()
    color = models.CharField(max_length=20)
    ability = models.CharField(max_length=20)