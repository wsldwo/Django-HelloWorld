"""HelloWorld URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.urls import path,include,reverse,re_path
from django.conf.urls import url
from . import views,testdb

from django.views.static import serve

from django.conf import settings
from django.conf.urls.static import static


'''
    统一资源定位系统（uniform resource locator;URL）是因特网的万维网服务程序上用于指定信息位置的表示方法。
    它最初是由蒂姆·伯纳斯·李发明用来作为万维网的地址。现在它已经被万维网联盟编制为互联网标准RFC1738。
    因特网上的可用资源可以用简单字符串来表示，该文档就是描述了这种字符串的语法和语义。而这些字符串则被称为：“统一资源定位器”（URL）。
    这篇说明源于万维网全球信息主动组织（World Wide Web global informationinitiative）介绍的概念。
    RFC1630《通用资源标志符》描述了一些对象数据，他们自1990年起就开始使用这些对象数据。
    这篇URL说明符合《因特网资源定位符的功能需求（Functional Requirements for Internet Resource Locators）》中说明的需求。
    这篇文档是由工程任务组织（IETF）的URI工作小组写的 [1]  。
'''
    
urlpatterns = [
    path('admin/', admin.site.urls), #管理员界面 root Complex2020
    path('accounts/',include('SchoolApp.urls')),#账户登录界面 路由分发:元组形式(模块名.urls,命名空间)

    url(r'^$',views.home,name='home'),   #只有url才能使用正则表达式
    url(r'he.*',views.hello), #只有url才能使用正则表达式
    path('welcome/',views.welcome,name='welcome'), #path需传入具体路径
    path('home2/',views.home2,name='newhome'), #path需传入具体路径
    path('testdb/',testdb.testdb),
    
    #path('pony/',views.pony),
    #path('pony_search/',views.pony_search),
    #path('pony_insert/',views.pony_insert)
    path('PonyApp/',include(('PonyApp.urls','PonyApp'))),#路由分发:元组形式(模块名.urls,命名空间)
    path('SchoolApp/',include(('SchoolApp.urls','SchoolApp'))),#路由分发:元组形式(模块名.urls,命名空间)
	path('TerminatorApp/',include(('TerminatorApp.urls','TerminatorApp'))),#路由分发:元组形式(模块名.urls,命名空间)
    re_path(r'^static/(?P<path>.*)$', serve, {'document_root': settings.STATIC_ROOT}),
    
]
