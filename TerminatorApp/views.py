from django.http import HttpResponse
from django.shortcuts import render,redirect
from django.urls import path,include,reverse
from datetime import datetime as dt
# Create your views here.
def index(request):
    if request.method == 'GET':
        return render(request,'terminator-index.html',{})
    else:
        return render(request,'terminator-index.html',{})