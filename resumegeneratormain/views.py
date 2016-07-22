from django.shortcuts import render

from django.contrib.auth.models import User
from weasyprint import HTML, CSS

from django.template import loader

from django.http import HttpResponse

def resume(request):
	data = {"user": User.objects.get(username="sample_user")}
	return render(request, "BlankResume.html", data)

def resumePdf(request):
	template = loader.get_template("BlankResume.html")
	data = {"user": User.objects.get(username="sample_user")}
	html = template.render(data)
	css = CSS(filename='resumegeneratormain/static/resumegeneratormain/css/blank-resume.css')
	pdf = HTML(string=html).write_pdf(stylesheets=[css])
	return HttpResponse(pdf, content_type='application/pdf')
