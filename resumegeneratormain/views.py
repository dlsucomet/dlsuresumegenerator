from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from weasyprint import HTML, CSS

from django.template import loader

from django.http import HttpResponse

#def login_view(request):
#	if request.method == "POST":
#		username = request.POST['username']
#		password = request.POST['password']
#		user = authenticate(username = username, password = password)
#		if user is not None and user.is_active:
#			login(request,user)
#			return redirect('/')
#		else:
			#failed

#	else:
#		return render(request, "loginpage") #loginpage ng resumegen

#def logout_view(request):
#	logout(request)
#	return redirect('/login')

def resume(request):
	data = {"user": User.objects.get(username="11438029_richardlancegparayno")}
	return render(request, "BlankResume.html", data)

def resumePdf(request):
	template = loader.get_template("BlankResume.html")
	data = {"user": User.objects.get(username="11438029_richardlancegparayno")}
	html = template.render(data)
	css = CSS(filename='resumegeneratormain/static/resumegeneratormain/css/blank-resume.css')
	pdf = HTML(string=html,base_url='/Users/Admin/dlsuresumegenerator').write_pdf(stylesheets=[css])
	return HttpResponse(pdf, content_type='application/pdf')
