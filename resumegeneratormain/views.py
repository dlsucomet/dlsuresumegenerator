from django.shortcuts import render

from django.contrib.auth.models import User

def resume(request):
	data = {"user": User.objects.get(username="sample_user")}
	return render(request, "BlankResume.html", data)
