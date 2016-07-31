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
def submit_data(request):
	if request.method == "POST":
		user = request.user()

		## address
		address_line_one = request.POST['address_line_one']
		address_line_two = request.POST['address_line_two']
		address = (user, address_line_one, address_line_two)
		address.save()

		## cellphone
		cellphone_number = request.POST['Cellphone']
		CellphoneNumber = (user, cellphone_number)
		CellphoneNumber.save()

		## telephone
		telephone_number = request.POST['Telephone']
		TelephoneNumber = (user, telephone_number)
		TelephoneNumber.save()

		## education
		school = request.POST['Education']
		education_attained = request.POST['EducationAttained']
		year_start = request.POST['FromEd']
		year_finish = request.POST['ToEd']
		month_attained = request.POST['EducationAttainedDate']
		year_attained = request.POST['EducationAttainedDate']
		Education = (user, school, education_attained, year_start, year_finish, month_attained, year_attained)
		Education.save()

		## achievements
		achievement_name = request.POST['Achievements']
		Achievement = (user, achievement_name)
		Achievement.save()

		## education award
		award_description = request.POST['Award']
		award_date = request.POST['AwardAttainedDate']
		EducationAward = (school, award_description, award_date)
		EducationAward.save()

		## work experience
		month_start = request.POST['FromWork']
		month_finish = request.POST['ToWork']
		year_finish = request.POST['ToWork']
		position = request.POST['WorkPosition']
		company = request.POST['WorkOrganization']
		workdone = request.POST['WorkDone']
		WorkExperience = (user, month_start, month_finish, year_finish, position, company, workdone)
		WorkExperience.save()

		## extra curricular
		organization = request.POST['CocurOrganization']
		position = request.POST['CocurPosition']
		work_done = request.POST['CocurDone']
		year_start = request.POST['FromCoCur']
		year_finish = request.POST['ToCoCur']
		ExtraCurricular = (user, organization, position, work_done, year_start, year_finish)
		ExtraCurricular.save()

		## seminars attended
		month = request.POST['SeminarAttendedDate']
		year = request.POST['SeminarAttendedDated']
		title = request.POST['SeminarAttendedName']
		seminar_head = request.POST['SeminarAttendedOrganization']
		venue = request.POST['SeminarAttendedLocation']
		SeminarAttended = (user, month, year, title, seminar_head, venue)
		SeminarAttended.save()

		## seminars conducted
		month = request.POST['SeminarConductedDate']
		year = request.POST['SeminarConductedDated']
		position = request.POST['SeminarConductedPosition']
		title = request.POST['SeminarConductedName']
		seminar_head = request.POST['SeminarConductedOrganization']
		venue = request.POST['SeminarConductedLocation']
		SeminarConducted = (user, month, year, position, title, seminar_head, venue)
		SeminarConducted.save()

		## research paper
		month = request.POST['ResearchPaperDate']
		year = request.POST['ResearchPaperDate']
		title = request.POST['ResearchPaperTitle']
		summary = request.POST['ResearchPaperSummary']
		ResearchPaper = (user, month, year, title, summary)
		ResearchPaper.save()

		## user profile
		background = request.POST['PersonalBackground']
		UserProfile.background = background
		UserProfile.background.save()
		UserProfile.save()

	return render(request, 'resume')
