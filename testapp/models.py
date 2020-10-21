from django.db import models

# Create your models here.
class test(models.Model):
    '''
    添加新字段，需要重新执行以下命令
    $ python3 manage.py migrate   # 创建表结构
    $ python3 manage.py makemigrations xxxApp  # 让 Django 知道我们在我们的模型有一些变更
    $ python3 manage.py migrate xxxApp   # 创建表结构
    '''
    name = models.CharField(max_length=20)
    color = models.CharField(max_length=20,default='')
    #ability = models.CharField(max_length=40)
    #DecimalField.max_digits（整个数字的长度）和DecimalField.decimal_places（小数点后面的有效位数）
    #age = models.DecimalField(max_digits=9,decimal_places=2)


class pony(models.Model):
    name = models.CharField(max_length=20)
    age = models.IntegerField()
    color = models.CharField(max_length=20)
    ability = models.CharField(max_length=20)
    #DecimalField.max_digits（整个数字的长度）和DecimalField.decimal_places（小数点后面的有效位数）
    

    
