from django.db import models

# Create your models here.
class Student(models.Model):
    no = models.AutoField(primary_key=True)
    name = models.CharField(max_length=20)
    age = models.SmallIntegerField()
    gender = models.CharField(max_length=2)
    _class = models.ForeignKey('Class',on_delete=models.CASCADE) # 一对多
class Class(models.Model):
    name = models.CharField(max_length=20)
    population = models.SmallIntegerField()
    classteacher = models.OneToOneField('Teacher',related_name='teacher_classteacher',verbose_name='班主任',on_delete=models.CASCADE) # 班级&班主任 一对一
    teachers = models.ManyToManyField('Teacher',related_name='teacher_teachers',verbose_name='科任教师') # 班级&科任教师 多对多
class Teacher(models.Model):
    name = models.CharField(max_length=20)
    age = models.SmallIntegerField()
    gender = models.CharField(max_length=2)
    tel = models.CharField(max_length=20)
    addr = models.CharField(max_length=40)


