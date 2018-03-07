from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.contrib import messages
from django.template import loader

import numpy as np
import sys

#import shit for pylatex
import os
from pylatex import Document, Tabu, LineBreak, Command, StandAloneGraphic,MultiRow,Figure
from pylatex.utils import bold, NoEscape

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

#def profile(request):
#	return render(request, "Profile.html")

def profile(request):
    	return render(request, 'profile.html')

def header(request):
    	return render(request, 'header.html')

def generate(request):
	geometry_options = {
	    "margin" : "1in",
	    "textwidth" : "2in",
	    "textheight" : "2in",
	    "headheight" : "0pt",
	    "headsep" : "0pt",
	    "footskip" : "0pt"
	}

	doc = Document(geometry_options=geometry_options)
	doc.preamble.append(Command("usepackage","times"))
	doc.preamble.append(Command("usepackage","graphicx"))
	doc.documentclass = Command('documentclass',options=['11pt'],arguments=['article'])	
	#Personal information header
	with doc.create(Tabu("X[l]  X[l]  X[r] ")) as table: #Personal Information
	    table.add_row(bold("Juan De la Cruz"),"",MultiRow(5,data=Command('includegraphics','juandelacruz','width=100px,height=80px'))) #Name and Photo(photo must be in same folder)
	    table.add_row("1234 Taal Street, Singalong, Malate, Manila 1004",
	    "23 Maison Road, Malinta, Valenzuela City 1440",
	    "") #Address1 & Address2 
	    table.add_row("(02) 123-4567; 123-4567", 
	    "(02) 123-4567",
	    "") #Landline number
	    table.add_row("+63917891234","","") #mobile number
	    table.add_row("juancruz@yahoo.com","","") #email
	    table.add_empty_row()	
	with doc.create(Tabu("X[l] X[3l]")) as table: #Objective
	    table.add_row(bold("OBJECTIVE"),"") 
	    table.add_empty_row()
	    table.add_row("","To join an organization where I can use my skills in personnel administration and attain a high level of performance in personnel recruitment and training.") #Objective
	    table.add_empty_row()	
	with doc.create(Tabu("X[l] X[3l]")) as table: #Education
	    table.add_row(bold("EDUCATION"),"")
	    table.add_empty_row()
	    table.add_row("YEAR","UNIVERSITY") #Year and Univesity attended
	    table.add_row("","Degree and academic related awards") #Degree & Awards
	    table.add_empty_row()
	    table.add_row("YEAR","HIGHSCHOOL") #Year and Highschool attended
	    table.add_row("","academic related awards") #Awards
	    table.add_empty_row() 

	with doc.create(Tabu("X[l] X[3l]")) as table: #Work
	    table.add_row(bold("WORK EXPERIENCE"),"")
	    table.add_empty_row()
	    table.add_row("Month Year - Month Year",
	    "PRACTICUM TRAINEE, FEDERAL EXPRESS") #Position & Company
	    table.add_row("","Assited the Research and Development Superviser in gathering data............") #Job description
	    table.add_empty_row()
	    table.add_row("Month Year - Month Year",
	    "ACCOUNT EXECUTIVE, CITIBANK") #Position & Company
	    table.add_row("","Handled the accounts of new customers and advised them on their financial endeavors.") #Job description
	    table.add_empty_row()	
	with doc.create(Tabu("X[l] X[3l]")) as table: #Co-Curricular Activities
	    table.add_row(bold("CO-CURRICULAR ACTIVITIES"),"")
	    table.add_empty_row()
	    table.add_row("YEAR-YEAR","RESEARCH AND DEVELOPMENT HEAD, DLSU-COUNCIL OF STUDENT ORGANIZTIONS(CSO)") #Position & Company
	    table.add_row("","Initiated the following projects: CSO budget defense proposal.........") #description
	    table.add_empty_row()

	with doc.create(Tabu("X[l] X[3l]")) as table: #Seminars Attended
	    table.add_row(bold("SEMINARS ATTENDED"),"")
	    table.add_empty_row() 
	    table.add_row("MONTH YEAR","RELATIONSHIPS SEMINAR") #Month and Year of Seminar and Title of Seminar
	    table.add_row("","Student Development Office, De La Salle University") #Host of Seminar and Venue
	    table.add_empty_row()	
	with doc.create(Tabu("X[l] X[3l]")) as table: #Seminars Conducted
	    table.add_row(bold("SEMINARS CONDUCTED"),"")
	    table.add_empty_row()
	    table.add_row("MONTH YEAR", "FACILITATOR, RELATIONSHIPS SEMINAR") #Month & Year of seminar and Role & Title
	    table.add_row("","Student Development Office, De La Salle University") #Host of seminar and venue
	    table.add_empty_row()

	with doc.create(Tabu("X[l] X[3l]")) as table: #Research Papers
	    table.add_row(bold("RESEARCH PAPERS PREPARED"),"")
	    table.add_empty_row()
	    table.add_row("MONTH YEAR","AN ORDERED PROBIT MODEL OF APPLICATIONS TO DLSU'S BUSINESS........") #Month & Year and Title of paper
	    table.add_row("","Estimated a utility function that discusses the probabilities of highschool graduates......") #Description of paper
	    table.add_empty_row()

	with doc.create(Tabu("X[l] X[3l]")) as table: #Personal background
	    table.add_row(bold("PERSONAL BACKGROUND"),"")
	    table.add_empty_row()
	    table.add_row("","Fluent in English and Filipino. Knowledgeable in MS programs........") 
	    table.add_empty_row()

	with doc.create(Tabu("X[l] X[3l]")) as table: #References
	    table.add_row(bold("REFERENCES"),"") 
	    table.add_empty_row()
	    table.add_row("", "PAMELA S. SANTOS") #name
	    table.add_row("","PSYCHOLOGY PROFESSOR") #position
	    table.add_row("","987-6543; +63917876543;pamela.santos@dlsu.edu.ph") #contact details
	    table.add_row("","2401 Taft Ave, Malate, Manila, 1004 Metro Manila") #address
	    table.add_empty_row()

	doc.generate_pdf("DLSUResume", clean_tex=False)	
	return FileResponse(open('DLSUResume.pdf','rb'), content_type='application/pdf')


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


