from django.shortcuts import render
from django.http import HttpResponse

#model imports
from models import Achievements
from models import Address
from models import Award
from models import Cellphone
from models import Curricular
from models import Education
from models import Login
from models import Researchpaper
from models import Seminarattend
from models import Seminarconduct
from models import Telephone
from models import User
from models import Workexp

# Create your views here.
def index(request):
	return render(request, 'resumegenerator/index.html')


def firstPage(request):
	return render(request, 'resumegenerator/DLSURGLogin.html')

def signUp(request):
	return render(request, 'resumegenerator/SignUp.html')

def mainPage(request):
	return render(request, 'resumegenerator/RGhomepage.html')
