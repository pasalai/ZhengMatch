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
import django
from django.contrib import admin
from django.urls import path, include, reverse_lazy
from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LoginView, LogoutView, PasswordResetView
from django.views.generic import CreateView
from pingtai import urls


urlpatterns = [
    path('', include('pingtai.urls')),
    path('admin/', admin.site.urls),
    path('login/', LoginView.as_view(template_name='login.html'), name="user_login"),
    # path('create/', CreateView.as_view(template_name='registration.html', model='UserWarning', form_class='SignUpForm', success_url=reverse_lazy('')), name="user_create"),
    path('logout/', LogoutView.as_view(template_name='logout.html', redirect_field_name='/login'), name="user_logout"),
]