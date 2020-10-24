from django.http import HttpResponse
from django.shortcuts import render,redirect
from django.views.decorators import csrf
from datetime import datetime as dt
from PonyApp.models import Pony
from django.urls import path,include,reverse


def hello(request):
    return HttpResponse('Hello!This is a website based on django!')


def home(request):
    return render(request, 'home.html', {'data_link1': '<a href="http://127.0.0.1:8000/welcome/">欢迎！</a>',
                                         'data_link2': '<a href="http://127.0.0.1:8000/home2/">这是新主页！</a>',

                                         })


def home2(request):
    return render(request, 'home2.html', {'data_link1': '<a href="http://127.0.0.1:8000/welcome/">欢迎！</a>',
                                          'data_link2': '<a href="http://127.0.0.1:8000/home2/">这是新主页！</a>',

                                          })


'''
Django 模板标签
变量

模板语法：

view：｛'html变量名' : '值'｝
html：｛｛变量名｝｝
'''


def welcome(request):
    return render(request, 'welcome.html', {'username': 'Darwin Leon',
                                            'data_list1': ['みんなの友達　鉄腕アトム', '心优しい　ラララ　科学の子', '十万马力だ　鉄腕アトム'],
                                            'data_dict1': {'歌手': '上高田少年合唱団', '专辑': '鉄腕アトム”オリジナル サウンド•トラック'},
                                            'time': dt.now(),  # dt.now().strftime('%Y-%m-%d %H:%M:%S')
                                            'data_str1': 'rarity',
                                            'data_link1': '<a href="http://127.0.0.1:8000/">首页</a>',
                                            'data_score1': 76,
                                            'data_list2': ['rarity', 'pinkie', 'twilight', 'starlight'],
                                            'data_dict2': {'rarity': 'white', 'pinkie': 'pink', 'twilight': 'purple'},
                                            'data_list3': [],
                                            })


def pony(request):
    return render(request, 'pony.html')

def pony_search(request):
    data = {}
    search_name = None
    search_color = None
    serach_ability = None
    search_age = None
    ponies = None
    if request.POST:

        print(list(request.POST.lists()))

        if request.POST['pony_name'] and request.POST['pony_name'] != '':
            data['search_result'] = []
            search_name = request.POST['pony_name']
            ponies = Pony.objects.filter(name=search_name)  # get方法不存在会报错

        if request.POST['pony_color'] and request.POST['pony_color'] != '':
            data['search_result'] = []
            search_color = request.POST['pony_color']
            if ponies:
                ponies = ponies.filter(color=search_color)
            else:
                ponies = Pony.objects.filter(color=search_color)

        if request.POST['pony_age'] and request.POST['pony_age'] != '':
            data['search_result'] = []
            search_age = request.POST['pony_age']
            if ponies:
                ponies = ponies.filter(age=search_age)
            else:
                ponies = Pony.objects.filter(age=search_age)

        if request.POST['pony_ability'] and request.POST['pony_ability'] != '':
            data['search_result'] = []
            serach_ability = request.POST['pony_ability']
            if ponies:
                ponies = ponies.filter(ability=serach_ability)
            else:
                ponies = Pony.objects.filter(ability=serach_ability)
        
        if request.POST['pony_name'] and request.POST['pony_name'] == '-':
            ponies = Pony.objects.all()

        if ponies:
            for x in ponies:
                if x:
                    data['search_result'].append(
                        x.name + ' '+str(x.age)+' '+x.color+' '+x.ability)
            list1 = data['search_result']
            data['search_result'] = '<br>'.join(list1)

    return render(request, 'pony.html', data)

def pony_insert(request):
    data = {}
    if request.POST and request.POST['pony_name'] != '' and request.POST['pony_age'] != '':
        pony = Pony(name=request.POST['pony_name'],age=request.POST['pony_age'],color=request.POST['pony_color'],ability=request.POST['pony_ability'])
        pony.save()
        data['insert_result'] = 'Insert OK!'

    return render(request, 'pony.html', data)

import random

def pony_test(request):
    data = {}
    data['result'] = []
    ponies = []
    color_list = ['Chocolate','Azure','DarkGray','GreenYellow','LawnGreen','LightSeaGreen','Silver','SpringGreen','Wheat','Tomato','Snow','Salmon','PeachPuff']
    ability_list = ['farmer','singer','actor','detective','teacher','nurse','doctor','zoo keeper','merchant','researcher','writer']
    firstname_list = ['banana','perl','watermelon','pienapple','strawberry','orange','cherry','flower','winter','spring','autunm','summer']
    lastname_list = ['noodle','cup','cake','computer','python','pen','book','game','math','water','ice','heart']
    #添加
    #1、实例化对象.save()
    for x in range(5):
        pony = Pony(name=random.choice(firstname_list)+' '+random.choice(lastname_list),
        age=random.randint(5,100),color=random.choice(color_list),ability=random.choice(ability_list))
        pony.save()
        ponies.append(pony)
    #2、model.objects.create()
    for x in range(5):
        pony = Pony.objects.create(name=random.choice(firstname_list)+' '+random.choice(lastname_list),
        age=random.randint(5,100),color=random.choice(color_list),ability=random.choice(ability_list))
        ponies.append(pony)

    #查询
    #1、model.objects.all()    返回所有 返回的是 QuerySet 类型数据，类似于 list，里面放的是一个个模型类的对象，可用索引下标取出模型类的对象

    #2、model.objects.filter() 筛选     返回的是 QuerySet 类型数据，类似于 list，里面放的是满足条件的模型类的对象，可用索引下标取出模型类的对象。
                                        #pk=3 的意思是主键 primary key=3，相当于 id=3。因为 id 在 pycharm 里有特殊含义，是看内存地址的内置函数 id()，因此用 pk。
    pony = Pony.objects.filter(pk=66).first()
    ponies.append(pony)

    #3、model.objects.get() 获取单个对象 用于查询符合条件的返回模型类的对象符合条件的对象只能为一个，如果符合筛选条件的对象超过了一个或者没有一个都会抛出错误
    pony = Pony.objects.get(pk=88)
    ponies.append(pony)

    #4、order_by() 方法用于对查询结果进行排序。 返回的是 QuerySet类型数据，类似于list，里面放的是排序后的模型类的对象，可用索引下标取出模型类的对象。
    #ponies.clear()
    #ponies = Pony.objects.all().order_by('age')  #升序
    #ponies = Pony.objects.all().order_by('-age') #降序
    
    #5、reverse() 方法用于对查询结果进行反转。返回的是 QuerySet类型数据，类似于 list，里面放的是反转后的模型类的对象，可用索引下标取出模型类的对象。
    #6、count() 方法用于查询数据的数量返回的数据是整数。
    #7、first() 方法返回第一条数据返回的数据是模型类的对象也可以用索引下标 [0]。
    #8、last() 方法返回最后一条数据返回的数据是模型类的对象不能用索引下标 [-1]，ORM 没有逆序索引。
    #9、exists() 方法用于判断查询的结果 QuerySet 列表里是否有数据。返回的数据类型是布尔，有为 true，没有为 false。注意：判断的数据类型只能为 QuerySet 类型数据，不能为整型和模型类的对象。
    #10、values() 方法用于查询部分字段的数据。返回的是 QuerySet 类型数据，类似于 list，里面不是模型类的对象，而是一个可迭代的字典序列，字典里的键是字段，值是数据。
    '''
    # 查询所有的id字段和price字段的数据
    books = models.Book.objects.values("pk","price")
    print(books[0]["price"],type(books)) # 字典序列 得到的是第一条记录的price字段的数据
    '''
    #11、values_list() 方法用于查询部分字段的数据。返回的是 QuerySet 类型数据，类似于 list，里面不是模型类的对象，而是一个个元组，元组里放的是查询字段对应的数据。
    '''
    # 查询所有的price字段和publish字段的数据
    books = models.Book.objects.values_list("price","publish")
    print(books[0][0],type(books)) # 元组序列 得到的是第一条记录的price字段的数据
    '''
    #12、distinct() 方法用于对数据进行去重。返回的是 QuerySet 类型数据。注意：对模型类的对象去重没有意义，因为每个对象都是一个不一样的存在。
    # distinct() 一般是联合 values 或者 values_list 使用。
    '''
    # 查询一共有多少个出版社
    books = models.Book.objects.values_list("publish").distinct() # 对模型类的对象去重没有意义，因为每个对象都是一个不一样的存在。
    books = models.Book.objects.distinct()
    '''

    #13、filter() 方法基于双下划线的模糊查询（exclude 同理）。
    # 注意：filter 中运算符号只能使用等于号 = ，不能使用大于号 > ，小于号 < ，等等其他符号。

    # __in 用于读取区间，= 号后面为列表 。
    '''
    # 查询价格为200或者300的数据
    books = models.Book.objects.filter(price__in=[200,300])
    '''
    # __gt 大于号 ，= 号后面为数字。
    '''
    # 查询价格大于200的数据 
    books = models.Book.objects.filter(price__gt=200)
    '''
    # __gte 大于等于，= 号后面为数字。
    '''
    # 查询价格大于等于200的数据 
    books = models.Book.objects.filter(price__gte=200)
    '''
    # __lt 小于，=号后面为数字。
    '''
    # 查询价格小于300的数据 
    books=models.Book.objects.filter(price__lt=300)
    '''
    # __lte 小于等于，= 号后面为数字。
    '''
    # 查询价格小于等于300的数据 
    books=models.Book.objects.filter(price__lte=300)
    '''
    # __range 在 ... 之间，左闭右闭区间，= 号后面为两个元素的列表。
    '''
    # 查询价格处于200到300的数据
    books=models.Book.objects.filter(price__range=[200,300])
    '''
    # __contains 包含，= 号后面为字符串。
    '''
    books=models.Book.objects.filter(title__contains="django")
    '''
    # __icontains 不区分大小写的包含，= 号后面为字符串。
    '''
    books=models.Book.objects.filter(title__icontains="python") # 不区分大小写
    '''
    # __startswith 以指定字符开头，= 号后面为字符串。
    '''
    books=models.Book.objects.filter(title__startswith="django")
    '''
    # __endswith 以指定字符结尾，= 号后面为字符串。
    '''
    books=models.Book.objects.filter(title__endswith="python")
    '''
    # __year 是 DateField 数据类型的年份，= 号后面为数字。
    # __month 是DateField 数据类型的月份，= 号后面为数字。
    # __day 是DateField 数据类型的天数，= 号后面为数字。
    '''
    books=models.Book.objects.filter(pub_date__year=2008) 
    books=models.Book.objects.filter(pub_date__month=10) 
    books=models.Book.objects.filter(pub_date__day=01)
    '''

    #删除
    #1、使用 模型类对象.delete() 返回值：元组，第一个元素为受影响的行数。
    '''
    books=models.Book.objects.filter(pk=8).first().delete()
    '''
    #2、使用 QuerySet 类型数据.delete()(推荐) 返回值：元组，第一个元素为受影响的行数。
    '''
    books=models.Book.objects.filter(pk__in=[1,2]).delete()
    '''

    #修改
    #1、模型类对象.属性 = 更改的属性值 
    #   模型类的对象.save()
    '''
    books = models.Book.objects.filter(pk=7).first() 
    books.price = 400 books.save()
    '''
    #2、QuerySet 类型数据.update(字段名=更改的数据)（推荐）
    '''
    books = models.Book.objects.filter(pk__in=[7,8]).update(price=888)
    '''


    if ponies:
            for x in ponies:
                if x:
                    data['result'].append(str(x.pk) + ' '+ x.name + ' '+str(x.age)+' '+x.color+' '+x.ability)
            list1 = data['result']
            data['result'] = '<br>'.join(list1)

    return render(request, 'pony-test.html', data)

        
    