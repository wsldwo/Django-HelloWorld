from django.http import HttpResponse
from django.shortcuts import render,redirect
from django.db.models import Avg,Max,Min,Count,Sum
from SchoolApp.models import Student,Teacher,Class
from django.db.models import F,Q
from SchoolApp.forms import StudentForm
from django.contrib import auth
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.urls import path,include,reverse
from datetime import datetime as dt

# Create your views here.
def student(request):
    if request.method == 'GET':
        return render(request,'student.html',{})
    else:
        return render(request,'student.html',{})

def student_search(request):
    data = {}
    search_name = None
    search_age = None
    search_gender = None
    serach_class = None
    students = None
    data['search_result'] = []
    if request.POST:
        if request.POST['student_name'] and request.POST['student_name'] != '':
            
            search_name = request.POST['student_name']
            students = Student.objects.filter(name=search_name)  # get方法不存在会报错

        if request.POST['student_age'] and request.POST['student_age'] != '':
            
            search_age = request.POST['student_age']
            if students:
                students = students.filter(age=search_age)
            else:
                students = Student.objects.filter(age=search_age)

        if request.POST['student_gender'] and request.POST['student_gender'] != '':
            
            search_gender = request.POST['student_gender']
            if students:
                students = students.filter(gender=search_gender)
            else:
                students = Student.objects.filter(gender=search_gender)

        if request.POST['student_class'] and request.POST['student_class'] != '':
            
            serach_class = request.POST['student_class']
            if students:
                students = students.filter(_class__name=serach_class)
            else:
                students = Student.objects.filter(_class__name=serach_class)

        if request.POST['student_name'] and request.POST['student_name'] == '-':
            students = Student.objects.all()
        
        if students:
            for x in students:
                if x:
                    data['search_result'].append(
                        x.name + ' '+str(x.age)+' '+x.gender+' '+x._class.name)
            list1 = data['search_result']
            data['search_result'] = '<br>'.join(list1)

    return render(request,'student.html',data)

def student_insert(request):
    data = {}
    if request.POST and request.POST['student_name'] != '' and request.POST['student_age'] != '':
        cls_dict = {'高二4班':1,'高二1班':2,'高二2班':3}
        student = Student(name=request.POST['student_name'],age=request.POST['student_age'],gender=request.POST['student_gender'],_class_id=cls_dict[request.POST['student_class']])
        student.save()
        data['insert_result'] = 'Insert OK!'
    return render(request,'student.html',data)

def school(request):
    data = {}
    #_class = Class.objects.get(pk=1) #获取班级对象
    #多对多 写值
    #1、传对象
    #lu = Teacher.objects.get(pk=7)
    #_class.teachers.add(lu)
    #2、传id
    #_class.teachers.add(16,17,18) #添加教师
    #wang_id = Teacher.objects.get(name='王洪波').pk
    #class2 = Class.objects.create(name='高二2班',population=52,classteacher_id=wang_id)
    #class2.teachers.add(8,12,15,17)
    #Class.objects.get(name='高二2班').teachers.add(19)

    '''
    基于对象的单表、跨表查询

    正向 对象.属性名
    反向 对象.小写类名_set (未设置related_name)
    反向 对象.related_name (已设置related_name)
    '''

    #单表查询
    #1、查询高二4班所有女生
    students = Student.objects.filter(_class='1',gender='女') # 多条件筛选
    #2、查询高二1班所有男生
    students = Student.objects.filter(_class='2',gender='男') # 多条件筛选
    #3、查询高二1班所有科任教师
    teachers = Class.objects.filter(name='高二1班').first().teachers.all() # 容器字段必须加.all()
    #print(teachers)



    #跨表查询
    #1、查询石蕊同学的班主任电话号码
    student = Student.objects.filter(name='石蕊',gender='女').first()
    tel = student._class.classteacher.tel #正向 属性名

    #2、查询高二4班所有男学生
    class4 = Class.objects.filter(name='高二4班').first()
    students = class4.student_set.filter(gender='男') # 反向 小写类名_set (未设置related_name)
    '''
    class4.student_set.all() # 所有高二4班学生
	class4.student_set.filter() # 从高二4班学生中进行筛选
	class4.student_set.create(...)  # 创建新的高二4班学生
	class4.student_set.add(student)   # 添加新的高二4班学生
    '''

    #3、查询芦老师带的所有班级
    lu = Teacher.objects.get(pk=7)
    classes = lu.teacher_teachers.all() # 反向 related_name (已设置related_name)

    if classes:
        data_list = []
        for clss in classes:
            data_list.append(clss.name + str(clss.population))
        
        data['result'] = '<br>'.join(data_list)
    

    if students:
        data_list = []
        for stu in students:
            data_list.append(stu.name+' '+str(stu.age)+' '+stu.gender+' '+stu._class.name #正向 属性名
            +' '+str(stu.no)) 

        data['result'] += '<br>'+'<br>'.join(data_list) + '<br>'

    
    if teachers:
        data_list = []
        for teacher in teachers:
            data_list.append(teacher.name+' '+str(teacher.age)+' '+teacher.gender+' '+teacher.addr
            +' '+teacher.tel)

        data['result'] += '<br>'+'<br>'.join(data_list) + '<br>'


    '''
    基于双下划线的跨表查询

    正向：属性名称__跨表的属性名称 
    反向：小写类名__跨表的属性名称 (未设置related_name)
    反向：related_name__跨表的属性名称 (已设置related_name)
    '''

    #1、查询高二4班的所有女生的名字、年龄（正向）
    students = Student.objects.filter(_class__name='高二4班',gender='女').values('name','age') #返回字典集合
    if students:
        data_list = []
        for stu in students:
            data_list.append(stu['name']+' '+str(stu['age'])) 

        data['result'] += '<br>'+'<br>'.join(data_list) + '<br>' + tel + '<br>'

    #2、查询王洪波所带的班级信息（反向）
    classes1 = Teacher.objects.filter(name='王洪波').values_list('teacher_teachers__name','teacher_teachers__population') #返回元组集合
    '''
    因为王洪波是班主任，所以应该使用teacher_classteacher__name和teacher_classteacher__population
    '''
    classes2 = Teacher.objects.filter(name='王洪波').values_list('teacher_classteacher__name','teacher_classteacher__population') #返回元组集合
    classes = classes1.union(classes2)
    if classes:
        data_list = []
        for clss in classes:
            if clss[0]:
                data_list.append(str(clss[0]) +'  '+ str(clss[1]))
        
        data['result'] += '<br>'.join(data_list)
    
    '''
    聚合函数查询 aggregate()
    聚合查询函数是对一组值执行计算，并返回单个值。
    聚合查询返回值的数据类型是字典。
    聚合函数 aggregate() 是 QuerySet 的一个终止子句， 生成的一个汇总值，相当于 count()。
    使用 aggregate() 后，数据类型就变为字典，不能再使用 QuerySet 数据类型的一些 API 了。
    日期数据类型(DateField)可以用 Max 和 Min。
    返回的字典中：键的名称默认是（属性名称加上__聚合函数名），值是计算出来的聚合值。
    如果要自定义返回字典的键的名称，可以起别名：
    aggregate(别名 = 聚合函数名("属性名称"))
    '''
    
    
    #计算高二2班所有科任教师的数量、最大年龄、平均年龄
    res = Class.objects.filter(name='高二2班').first().teachers.all().aggregate(c=Count('id'),m=Max('age'),a=Avg('age'))#返回字典类型
    data['result'] += '<br>'+str(res) #{'c': 4, 'm': 40, 'a': 28.5} 

    '''
    分组查询 annotate()
    一般会用到聚合函数，所以使用前要先从 django.db.models 引入 Avg,Max,Min,Count,Sum（首字母大写）。

    返回值：
    分组后，用 values 取值，则返回值是 QuerySet 数据类型里面为一个个字典（字典序列）；
    分组后，用 values_list 取值，则返回值是 QuerySet 数据类型里面为一个个元组（元组序列）。
    MySQL 中的 limit 相当于 ORM 中的 QuerySet 数据类型的切片。

    注意：
    annotate 里面放聚合函数。
    values 或者 values_list 放在 annotate 前面：values 或者 values_list 是声明以什么字段分组，annotate 执行分组。
    values 或者 values_list 放在annotate后面： annotate 表示直接以当前表的pk执行分组，values 或者 values_list 表示查询哪些字段， 并且要将 annotate 里的聚合函数起别名，在 values 或者 values_list 里写其别名。
    '''

    #查询每一个班学生的平均年龄
    res = Class.objects.annotate(avg_age=Avg('student__age')).values('name','population','classteacher__name','avg_age')
    if res:
        for x in res:
            data['result'] += '<br>'+x['name']+' '+str(x['population'])+' '+x['classteacher__name']+' '+str(x['avg_age'])+'<br>'
    
    #查询每一个班最大、最小年龄科任教师的信息
    res = Teacher.objects.values('teacher_teachers__name').annotate(max_age=Max('age'),min_age=Min('age'))
    if res:
        for x in res:
            if x['teacher_teachers__name']:
                '''
                暂时没想到别的办法了，只能基于双下划线反向按班级、年龄再查一遍！！！
                '''
                max_name = Teacher.objects.filter(teacher_teachers__name=x['teacher_teachers__name'],age=x['max_age']).first().name
                min_name = Teacher.objects.filter(teacher_teachers__name=x['teacher_teachers__name'],age=x['min_age']).first().name

                data['result'] += '<br>'+x['teacher_teachers__name']+' '+max_name+' '+str(x['max_age'])+' '+min_name+' '+str(x['min_age'])+'<br>'
    
    '''
    F() 查询
    F() 的实例可以在查询中引用字段，来比较同一个 model 实例中两个不同字段的值。
    之前构造的过滤器都只是将字段值与某个常量做比较，如果想要对两个字段的值做比较，就需要用到 F()。
    使用前要先从 django.db.models 引入 F:
    用法：
    F("字段名称")
    F 动态获取对象字段的值，可以进行运算。
    Django 支持 F() 对象之间以及 F() 对象和常数之间的加减乘除和取余的操作。
    修改操作（update）也可以使用 F() 函数。
    '''

    
    data['result'] += '<br>' + '<h2>把高二4班所有男生的年龄增加2岁</h2>' + '<br>'
    #把高二4班所有男生的年龄增加2岁
    Student.objects.filter(_class__name='高二4班',gender='男').update(age=F('age')+2)

    res = Student.objects.filter(_class__name='高二4班')
    
    if res:
        for x in res:
            data['result'] += '<br>' + x.name + str(x.age) + '<br>'

    '''
    Q() 查询
    使用前要先从 django.db.models 引入 Q: 
    from django.db.models import Q
    用法：
    Q(条件判断)
    之前构造的过滤器里的多个条件的关系都是 and，如果需要执行更复杂的查询（例如 or 语句），就可以使用 Q 。
    Q 对象可以使用 & | ~ （与 或 非）操作符进行组合。
    优先级从高到低：~ & |。
    可以混合使用 Q 对象和关键字参数，Q 对象和关键字参数是用"and"拼在一起的（即将逗号看成 and ），但是 Q 对象必须位于所有关键字参数的前面。
    '''

    #混合查询
    data['result'] += '<br>' + '<h1>混合查询</h1>' + '<br>'
    res = Student.objects.filter(Q(age__lt=15) | Q(name__contains='博'),_class__name='高二4班')
    if res:
        for x in res:
            data['result'] += '<br>' + x.name + str(x.age) + '<br>'

    return render(request, 'school.html', data)

@login_required
def add_student(request):
    if request.method == 'GET':
        #login = request.session.get('login')
        #login_time = request.session.get('login_time')
        login = request.COOKIES.get('login')
        login_time = request.COOKIES.get('login_time')
        sessionid = request.COOKIES.get('sessionid')
        csrftoken = request.COOKIES.get('csrftoken')
        data1 = request.session['data1']
        data2 = request.session['data2']
        
        form = StudentForm()
        return render(request,'add_student.html',{'form':form,'login':login,'login_time':login_time,'sessionid':sessionid,'csrftoken':csrftoken,'data1':data1,'data2':data2})
    
    else:
        form = StudentForm(request.POST)
        if form.is_valid():#校验数据
            data = form.cleaned_data #校验成功的值，会放在cleaned_data里。
            print(data)
            
            cid = data['class_id']
            del data['class_id']
            data['_class_id'] = cid
            Student.objects.create(**data)#{'name': '吕苗', 'age': 15, 'gender': '女', 'class_id': 1}
            return HttpResponse(str(data))
        else:
            return render(request,'add_student.html',{'form':form})
    return HttpResponse('!')


def login(request):#使用Auth组件+手动设置Cookie && Session
    '''
    创建用户对象的三种方法：

    create()：创建一个普通用户，密码是明文的。
    create_user()：创建一个普通用户，密码是密文的。
    create_superuser()：创建一个超级用户，密码是密文的，要多传一个邮箱 email 参数。
    '''
    #User.objects.create_user(username='user0924',password='20200924')

    if request.method == 'GET':
        return render(request,'login.html',{})
    else:
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = auth.authenticate(username=username,password=password)
        if user:#登录成功
            auth.login(request,user)#给验证成功的用户加 session，将 request.user 赋值为用户对象。
            response = redirect('/SchoolApp/add_student/')
            request.session['data1'] = 'ABC'
            request.session['data2']  = 'DEF'
            response.set_cookie('login',True)
            response.set_cookie('login_time',dt.now().strftime('%Y-%m-%d %H:%M:%S'))
            return response
            
        else:
            data = {}
            data['userdata'] = 'Login failed!' + '<br>' + username +'###'+ password
            return render(request,'login.html',data)

def logout(request):#登出
    #方式1
    auth.logout(request)
    #方式2
    #request.session.flush()
    return redirect('/SchoolApp/login/')
