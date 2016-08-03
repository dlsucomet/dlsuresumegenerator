from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from weasyprint import HTML, CSS

from django.template import loader

from django.http import HttpResponse

from resumegeneratormain.models import *


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
		password = request.POST['password']
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
		return render(request, "index")

def logout_view(request):
	logout(request)
	return redirect('index')

def resume(request):
	data = {"user": User.objects.get(username=request.user.username)}
	return render(request, "BlankResume.html", data)

def resumePdf(request):
	template = loader.get_template("BlankResume.html")
	data = {"user": User.objects.get(username=request.user.username)}
	html = template.render(data)
	css = CSS(filename='resumegeneratormain/static/resumegeneratormain/css/blank-resume.css')
	pdf = HTML(string=html,base_url='/Users/Admin/dlsuresumegenerator').write_pdf(stylesheets=[css])
	return HttpResponse(pdf, content_type='application/pdf')

## TODO: Edit to be in line with models.py
def submit_data(request):
	if request.method == "POST":

		## address
		address_line_one = request.POST.get('address_line_one')
		address_line_two = request.POST.get('address_line_two')
		address = Address(user=request.user, address_line_one=address_line_one, address_line_two=address_line_two)
		address.save()

		## cellphone
		cellphone_number = request.POST.get('Cellphone')
		cellphoneNumber = CellphoneNumber(user=request.user, number=cellphone_number)
		cellphoneNumber.save()

		## telephone
		telephone_number = request.POST.get('Telephone')
		telephoneNumber = TelephoneNumber(user=request.user, number=telephone_number)
		telephoneNumber.save()

		## education
		school = request.POST.get('Education')
		education_attained = request.POST.get('EducationAttained')
		year_start = request.POST.get('FromEd')
		year_finish = request.POST.get('ToEd')
		month_attained = request.POST.get('EducationAttainedMonth')
		year_attained = request.POST.get('EducationAttainedYear')
		education = Education(user=request.user, school=school, education_attained=education_attained, year_start=year_start, year_finish=year_finish, month_attained=month_attained, year_attained=year_attained)
		education.save()

		## achievements
		achievement_name = request.POST.get('Achievements')
		achievement = Achievement(user=request.user, name=achievement_name)
		achievement.save()

		## education award
		school = education
		award_description = request.POST.get('Award')
		award_date = request.POST.get('AwardAttainedYear')
		educationAward = EducationAward(user=request.user, school=school, award_description=award_description, award_date=award_date)
		educationAward.save()

		## work experience
		month_start = request.POST.get('FromWorkMonth')
		month_finish = request.POST.get('ToWorkMonth')
		year_finish = request.POST.get('ToWorkYear')
		position = request.POST.get('WorkPosition')
		company = request.POST.get('WorkOrganization')
		workdone = request.POST.get('WorkDone')
		workExperience = WorkExperience(user=request.user, month_start=month_start, month_finish=month_finish, year_finish=year_finish, position=position, company=company, workdone=workdone)
		workExperience.save()

		## extra curricular
		organization = request.POST.get('CocurOrganization')
		position = request.POST.get('CocurPosition')
		work_done = request.POST.get('CocurDone')
		year_start = request.POST.get('FromCoCur')
		year_finish = request.POST.get('ToCoCur')
		extraCurricular = ExtraCurricular(user=request.user, organization=organization, position=position, work_done=work_done, year_start=year_start, year_finish=year_finish)
		extraCurricular.save()

		## seminars attended
		month = request.POST.get('SeminarAttendedMonth')
		year = request.POST.get('SeminarAttendedYear')
		title = request.POST.get('SeminarAttendedName')
		seminar_head = request.POST.get('SeminarAttendedOrganization')
		venue = request.POST.get('SeminarAttendedLocation')
		seminarAttended = SeminarAttended(user=request.user, month=month, year=year, title=title, seminar_head=seminar_head, venue=venue)
		seminarAttended.save()

		## seminars conducted
		month = request.POST.get('SeminarConductedMonth')
		year = request.POST.get('SeminarConductedYear')
		position = request.POST.get('SeminarConductedPosition')
		title = request.POST.get('SeminarConductedName')
		seminar_head = request.POST.get('SeminarConductedOrganization')
		venue = request.POST.get('SeminarConductedLocation')
		seminarConducted = SeminarConducted(user=request.user, month=month, year=year, position=position, title=title, seminar_head=seminar_head, venue=venue)
		seminarConducted.save()

		## research paper
		month = request.POST.get('ResearchPaperMonth')
		year = request.POST.get('ResearchPaperYear')
		title = request.POST.get('ResearchPaperTitle')
		summary = request.POST.get('ResearchPaperSummary')
		researchPaper = ResearchPaper(user=request.user, month=month, year=year, title=title, summary=summary)
		researchPaper.save()

		## user profile
		user=request.user
		background = request.POST.get('PersonalBackground')
		objective = request.POST.get('Objective')
		userProfile = UserProfile(user=user, first_name=user.first_name, last_name=user.last_name, email=user.email, objective=objective, background=background)
		userProfile.save()

	return resumePdf(request)
