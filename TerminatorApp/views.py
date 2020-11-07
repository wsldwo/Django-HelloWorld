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
            auth.login(request, user_obj)
            #传数据
            request.session['username'] = request.POST['username_login']
            request.session['password'] = request.POST['password_login']
            return redirect(reverse('TerminatorApp:terminator_comment'))
    return render(request,'terminator-index.html',{})

@login_required
def comment(request):
    userinfo = 'Hello,'+request.session.get('username')+'!'+'<br>'+'Your password is '+request.session.get('password')
    if request.POST:
        if request.POST['message'] != '':
            Comment.objects.create(content=request.POST['message'],author=request.session.get('username'),date=dt.now())## dt.now().strftime('%Y-%m-%d %H:%M:%S')
            
    lc = Comment.objects.all()
    lccount = Comment.objects.all().count()
    return render(request,'terminator-comment.html',{'userinfo':userinfo,
        'comment1':lc[lccount-1].content,'comment2':lc[lccount-2].content,'comment3':lc[lccount-3].content,'comment4':lc[lccount-4].content,'comment5':lc[lccount-5].content,'comment6':lc[lccount-6].content,
        })