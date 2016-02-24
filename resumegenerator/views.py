from django.shortcuts import render

# Create your views here.
def firstPage(request):
	return render(request, 'resumegenerator/DLSURGLogin.html')

def signUp(request):
	return render(request, 'resumegenerator/SignUp.html')

def mainPage(request):
	return render(request, 'resumegenerator/RGhomepage.html')
