from django.http import HttpResponse
from django.shortcuts import render,redirect
from django.urls import path,include,reverse
from datetime import datetime as dt
from django.contrib.auth.decorators import login_required
# 认证模块
from django.contrib import auth
# 对应数据库
from django.contrib.auth.models import User
from TerminatorApp.models import Comment
# Create your views here.
def index(request):
    return render(request,'terminator-index.html',{})
    
def signup(request):
    if request.POST:
            if(User.objects.filter(username=request.POST['username']).first() == None):
                User.objects.create_user(username=request.POST['username'],password=request.POST['password'])
                #传数据
                request.session['username'] = request.POST['username']
                request.session['password'] = request.POST['password']
                return redirect(reverse('TerminatorApp:terminator_comment'))
            else:
                return render(request,'terminator-index.html',{'submit_result':'User existed!'})

def login(request):
    if request.POST:
        user_obj = auth.authenticate(username=request.POST['username_login'], password=request.POST['password_login'])
        if not user_obj:
            return render(request,'terminator-index.html',{'submit_result':'Login failed!'})
        else:
            #auth.login(request, user_obj)
            #传数据
            request.session['username'] = request.POST['username_login']
            request.session['password'] = request.POST['password_login']
            return redirect(reverse('TerminatorApp:terminator_comment'))
    return render(request,'terminator-index.html',{})

def comment(request):
    
    user_obj = auth.authenticate(username=request.session.get('username'), password=request.session.get('password'))
    if not user_obj:
        return redirect(reverse('TerminatorApp:terminator_index'))
    else:

        data = {}
        userinfo = 'Hello,'+request.session.get('username')+'!'+'<br>'+'Your password is '+request.session.get('password')
        data['userinfo'] = userinfo

        if request.POST:
            if request.POST['message'] != '':
                Comment.objects.create(content=request.POST['message'],author=request.session.get('username'),date=dt.now())## dt.now().strftime('%Y-%m-%d %H:%M:%S')
            
        comments = Comment.objects.all()
        commentLen = 6
    
        for no,com in enumerate(reversed(comments),start=1):
            data['comment'+str(no)] = com.content
            if no >= commentLen:#性能优化
                break

        return render(request,'terminator-comment.html',data)

