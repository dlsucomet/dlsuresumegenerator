from django.shortcuts import render

from django.contrib.auth.models import User
from weasyprint import HTML, CSS

from django.template import loader

from django.http import HttpResponse

def form(request):
	return render(request, "RGhomepage.html")

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
