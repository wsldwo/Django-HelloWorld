from django import forms
from django.core.exceptions import ValidationError
from SchoolApp.models import Student,Teacher,Class

class StudentForm(forms.Form):
    name = forms.CharField(label='姓名',error_messages={})
    age = forms.IntegerField(label='年龄',error_messages={})
    gender = forms.CharField(label='性别',error_messages={})
    class_id = forms.IntegerField(label='班级id',error_messages={})

    def clean_name(self):
        name = self.cleaned_data.get('name')
        if name.isdigit():
            raise ValidationError('用户名不能是纯数字！')
        elif Student.objects.filter(name=name):
            raise ValidationError('用户名已存在！')
        else:
            return name
    
    def clean_age(self):
        age = self.cleaned_data.get('age')
        if age > 100 or age < 10:
            raise ValidationError('年龄范围不正确！')
        else:
            return age
    
    def clean_gender(self):
        gender = self.cleaned_data.get('gender')
        if gender not in ('男','女'):
            raise ValidationError('请正确填写性别！')
        else:
            return gender
    
    def clean_class_id(self):
        class_id = self.cleaned_data.get('class_id')
        if class_id not in (1,2,3):
            raise ValidationError('查无此班！')
        else:
            return class_id

    '''
    def clean(self):#全局钩子，检验数据正确性
        name = self.cleaned_data.get('name')
        age = self.cleaned_data.get('age')
        gender = self.cleaned_data.get('gender')
        _class_id = self.cleaned_data.get('_class_id')

        if age > 100:
            raise ValidationError('年龄超过一百岁！')
        elif gender not in ('男','女'):
            raise ValidationError('请正确填写性别！')
        elif _class_id > 10:
            raise ValidationError('没有此班！')
        else:
            return self.cleaned_data
    '''