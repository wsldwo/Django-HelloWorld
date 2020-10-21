from django.contrib import admin
from PonyApp.models import Pony

# Register your models here.
#自定义表单
class PonyDisplay(admin.ModelAdmin):
    list_display = ('name','age','color','ability')
    fieldsets = (
        ['Main',{'fields':('name','age'),}],
        ['Advance',{
            'classes':('collapse',),
            'fields':('color','ability',),
        }],
    )


admin.site.register(Pony,PonyDisplay)