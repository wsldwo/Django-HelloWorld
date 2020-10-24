from django.http import HttpResponse
from PonyApp.models import Pony
from datetime import datetime as dt

#数据库操作
def testdb(request):
    #pony1 = Pony(name='fluttershy',age=17,color='pink',ability='animal expert')#str(dt.now().strftime('%Y-%m-%d %H:%M:%S'))  ,age=16 ,color='white'
    #pony1.save() # 等价于INSERT INTO TB (X,Y,Z) VALUES (x,y,z)


    #查询
    list1 = Pony.objects.all() # 等价于SELECT * FROM TB
    #res1 = Pony.objects.filter(color='white')
    #res2 = Pony.objects.filter(color='purple').order_by('id')
    
    #更新 | 插入
    '''
    pony1 = Pony.objects.get(id=5)
    pony1.name = 'rainbow dash'
    pony1.age = 16
    pony1.color = 'blue'
    pony1.ability = 'flyer team'
    pony1.save()
    '''
    
    # 另外一种方式
    #Pony.objects.filter(id=1).update(name='Google')
    
    # 修改所有的列
    #Pony.objects.all().update(name='Google')


    # 删除
    '''
    for x in range(7,11):#前闭后开
        pony1 = Pony.objects.get(id=x)
        pony1.delete()
    '''

    # 另外一种方式
    # Pony.objects.filter(id=1).delete()
    
    # 删除所有数据
    # Pony.objects.all().delete()

    res = ''
    for x in list1:
        res += x.name+' '+str(x.age)+' '+x.color+' '+x.ability +' '

    return HttpResponse(res)