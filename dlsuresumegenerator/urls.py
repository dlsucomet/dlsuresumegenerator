"""dlsuresumegenerator URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin

import resumegeneratormain.views as views


urlpatterns = [
	url(r'^google_sign_in/$', views.google_sign_in, name='google_sign_in'),
	url(r'^$', views.index, name='index'),
	url(r'^login/$', views.login_view, name='login'),
    url(r'^form/$', views.form, name='form'),
	url(r'^register/$', views.register, name='register'),
	#url(r'^register_account/$', views.register_account, name='register_account'),
    url(r'^resume/$', views.resume, name='resume'),
	url(r'^pdf/$', views.resumePdf, name='pdfconverted'),
	url(r'^submit_data/$', views.submit_data, name='submit'),
    url(r'^admin/', admin.site.urls, name='admin'),
    url(r'^profile/', views.profile, name='profile'),

]
