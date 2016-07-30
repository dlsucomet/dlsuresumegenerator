from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from weasyprint import HTML, CSS

from django.template import loader

from django.http import HttpResponse


def index(request):
	return render(request, "index.html")

def form(request):
	return render(request, "RGhomepage.html")

def register(request):
	return render(request, "SignUp.html")

## TODO: CATCH THE EXCEPTION WHEN AN ACCOUNT WITH THE SAME CREDENTIALS IS MADE
def register_account(request):
	if request.method =="POST":
		username = request.POST['username']
		first_name = request.POST['first_name']
		last_name = request.POST['last_name']
		email = request.POST['email']
		password = request.POST['email']
		user = User.objects.create_user(username = username, email = email, password = password)
		user.first_name = first_name
		user.last_name = last_name
		user.save()
	return redirect('index')

## TODO: Add a "user does not exist" alert
def login_view(request):
	if request.method == "POST":
		username = request.POST['username']
		password = request.POST['password']
		user = authenticate(username = username, password = password)
		if user is not None:
			login(request,user)
			return redirect('form')
		else:
			failed

	else:
		return render(request, "index")

def logout_view(request):
	logout(request)
	return redirect('index')

def resume(request):
	data = {"user": User.objects.get(username="test_user")}
	return render(request, "BlankResume.html", data)

def resumePdf(request):
	template = loader.get_template("BlankResume.html")
	data = {"user": User.objects.get(username="11438029_richardlancegparayno")}
	html = template.render(data)
	css = CSS(filename='resumegeneratormain/static/resumegeneratormain/css/blank-resume.css')
	pdf = HTML(string=html,base_url='/Users/Admin/dlsuresumegenerator').write_pdf(stylesheets=[css])
	return HttpResponse(pdf, content_type='application/pdf')

## TODO: Edit to be in line with models.py
def submitData(request):
	if request.method == "POST":
		user = request.POST.get('user')

		## achievements


		## address


		## award


		## cellphone


		## curricular


		## education


		## login


		## researchpaper


		## seminarattend



		## seminarconduct


		## telephone


		## user


		## workexp


		achievements.save()
		address.save()
		award.save()
		cellphone.save()
		curricular.save()
		education.save()
		login.save()
		researchpaper.save()
		seminarattend.save()
		seminarconduct.save()
		telephone.save()
		user.save()
		workexp.save()
	return render(request, 'RGhomepage.html')
