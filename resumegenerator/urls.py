from django.conf.urls import url, patterns
from . import views

app_name = 'resumegenerator'
urlpatterns = patterns('',
    url(r'^', views.firstPage, name='index'),
    url(r'^SignUp', views.signUp, name='register'),
    url(r'^RGhomepage', views.mainPage, name='welcome'),
)