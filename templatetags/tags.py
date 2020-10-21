from django import template
from django.utils.safestring import mark_safe

register = template.Library()

'''
利用装饰器 @register.filter 自定义过滤器。
注意：过滤器的参数最多只能有 2 个。
'''
@register.filter
def filter1(v1,v2):
    return v1**v2
'''
利用装饰器 @register.simple_tag 自定义标签。
'''
@register.simple_tag
def tag1(v1,v2,v3):
    return v1*v2*v3

@register.simple_tag
def tag2(v1,v2,v3):
    return mark_safe("<input type='text' id='%s' class='%s' placeholder='%s' />" % (v1, v2, v3))

