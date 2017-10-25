from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.contrib import messages
from django.template import loader

import numpy as np
import sys


from pylatex import Document, Section, Subsection, Tabular, Math, TikZ, Axis, \
		Plot, Figure, Matrix, Alignat
from pylatex.utils import italic
import os


from django.http import HttpResponse, HttpResponseNotFound, FileResponse

from resumegeneratormain.models import *
from reversion import views
from latexgenerate.generatetest import generatePDF


def google_sign_in(request):
	return render(request, "google_sign_in.html")

def index(request):
	return render(request, "test.html")

def form(request):
	return render(request, "RGhomepage.html")

def register(request):
	return render(request, "SignUp.html")

def profile(request):
	return render(request, "Profile.html")

def generate(request):
	image_filename = os.path.join(os.path.dirname(__file__), 'icon.png')
	geometry_options = {"tmargin": "1cm", "lmargin": "10cm"}
	doc = Document(geometry_options=geometry_options)
	
	with doc.create(Section('The simple stuff')):
			doc.append('Some regular text and some')
			doc.append(italic('italic text. '))
			doc.append('\nAlso some crazy characters: $&#{}')
			with doc.create(Subsection('Math that is incorrect')):
					doc.append(Math(data=['2*3', '=', 9]))

			with doc.create(Subsection('Table of something')):
					with doc.create(Tabular('rc|cl')) as table:
							table.add_hline()
							table.add_row((1, 2, 3, 4))
							table.add_hline(1, 2)
							table.add_empty_row()
							table.add_row((4, 5, 6, 7))

	a = np.array([[100, 10, 20]]).T
	M = np.matrix([[2, 3, 4],
							[0, 0, 1],
							[0, 0, 2]])
	with doc.create(Section('The fancy stuff')):
			with doc.create(Subsection('Correct matrix equations')):
					doc.append(Math(data=[Matrix(M), Matrix(a), '=', Matrix(M * a)]))

			with doc.create(Subsection('Alignat math environment')):
					with doc.create(Alignat(numbering=False, escape=False)) as agn:
							agn.append(r'\frac{a}{b} &= 0 \\')
							agn.extend([Matrix(M), Matrix(a), '&=', Matrix(M * a)])

			with doc.create(Subsection('Beautiful graphs')):
					with doc.create(TikZ()):
							plot_options = 'height=4cm, width=6cm, grid=major'
							with doc.create(Axis(options=plot_options)) as plot:
									plot.append(Plot(name='model', func='-x^5 - 242'))

									coordinates = [
											(-4.77778, 2027.60977),
											(-3.55556, 347.84069),
											(-2.33333, 22.58953),
											(-1.11111, -493.50066),
											(0.11111, 46.66082),
											(1.33333, -205.56286),
											(2.55556, -341.40638),
											(3.77778, -1169.24780),
											(5.00000, -3269.56775),
									]

									plot.append(Plot(name='estimate', coordinates=coordinates))

			with doc.create(Subsection('Cute kitten pictures')):
					with doc.create(Figure(position='h!')) as kitten_pic:
							kitten_pic.add_image(image_filename, width='120px')
							kitten_pic.add_caption('Look it\'s on its back')

	doc.generate_pdf('full', clean_tex=False)
	print('pdf generated')
	return FileResponse(open('full.pdf','rb'), content_type='application/pdf')



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


