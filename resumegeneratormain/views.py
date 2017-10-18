from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.contrib import messages
from django.template import loader


from django.http import HttpResponse, HttpResponseNotFound

from resumegeneratormain.models import *
from reversion import views


def google_sign_in(request):
	return render(request, "google_sign_in.html")

def index(request):
	return render(request, "index.html")

def form(request):
	return render(request, "RGhomepage.html")

def register(request):
	return render(request, "SignUp.html")

def profile(request):
	return render(request, "Profile.html")


## TODO: CATCH THE EXCEPTION WHEN AN ACCOUNT WITH THE SAME CREDENTIALS IS MADE
#def register_account(request):
#	if request.method =="POST":
#		username = request.POST['username']
#		first_name = request.POST['first_name']
#		last_name = request.POST['last_name']
#		email = request.POST['email']
#		password = request.POST['password']	
#		user = User.objects.create_user(username = username, email = email, password = password)
#		user.first_name = first_name
#		user.last_name = last_name
#		user.save()
#	return redirect('index')


# TODO: Add a "user does not exist" alert #alert('user typed is incorrect') 
def login_view(request):
	if request.method == "POST":
		username = request.POST['username']
		password = request.POST['password']
		user = authenticate(username = username, password = password)
		if user is not None:
			if user.is_active:
				login(request,user)
				return redirect('form')
			else:
				return HttpResponseNotFound('<h1>User is inactive. Please inform the administrator.')
		else:
			return HttpResponseNotFound('<h1>User does not exist')

	else:
		return render(request, "index")

def logout_view(request):
	logout(request)
	return redirect('index')


