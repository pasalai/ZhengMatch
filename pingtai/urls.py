"""ZhengMatch URL Configuration

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
from django.urls import path
import pingtai.views
from django.contrib.auth import views as auth_views
from django.contrib.auth.views import PasswordChangeView, PasswordChangeDoneView

urlpatterns = [
    path('', pingtai.views.getIndexPage),   # 比赛主页
    path('hello', pingtai.views.HelloWorld),    # 环境测试函数
    path('match/', pingtai.views.getMatchPage),  # 比赛详情
    path('push/', pingtai.views.pushFlag),  # 提交flag
    path('notice/', pingtai.views.getNotic),  # 公告模块
    path('creatDocker/', pingtai.views.CreateDocker),   # 创建Docker环境 未完成
    path('getuploadWriteUpFilePage/', pingtai.views.getuploadWriteUpFilePage),   # 提交WriteUp页面
    path('uploadwp/', pingtai.views.uploadWritefile),    # 接受上传的WP
    path('anticheating/', pingtai.views.getAntiCheatingPage),    # 烽火台


    # 修改密码
    path('password_change/', PasswordChangeView.as_view(), name='password_change'),
    path('password_change_done/', PasswordChangeDoneView.as_view(), name='password_change_done'),

    # path('addctfcategory/', pingtai.views.addCtfCategory),
]
