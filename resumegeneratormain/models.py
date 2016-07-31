from django.db import models
from django.contrib.auth.models import User

class Achievement(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	name = models.CharField(max_length=100)

	def __str__(self):
		return self.name

class Address(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	address_line_one = models.TextField()
	address_line_two = models.TextField()

	def __str__(self):
		return self.address_line_one

class CellphoneNumber(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	number = models.CharField(max_length=20)

	def __str__(self):
		return self.number

class ExtraCurricular(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	organization = models.CharField(max_length=45)
	position = models.CharField(max_length=45)
	work_done = models.TextField()
	year_start = models.DateField('%Y')
	year_finish = models.DateField('%Y')

	def __str__(self):
		return self.organization

class Education(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	school = models.CharField(max_length=45)
	education_attained = models.CharField(max_length=45)
	year_start = models.DateField('%Y')
	year_finish= models.DateField('%Y')
	month_attained = models.DateField('%m')
	year_attained = models.DateField('%Y')

	def __str__(self):
		return self.school

class EducationAward(models.Model):
	school = models.ForeignKey(Education, on_delete=models.CASCADE, null=True)
	award_description = models.CharField(max_length=45, blank=True, null=True)
	award_date = models.DateField('%Y', blank=True, null=True)

	def __str__(self):
		return self.award_description

class ResearchPaper(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	month = models.DateField('%m')
	year = models.DateField('%Y')
	title = models.CharField(max_length=70)
	summary = models.TextField()

	def __str__(self):
		return self.title

class SeminarAttended(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	month = models.DateField('%m')
	year = models.DateField('%Y')
	title = models.CharField(max_length=45)
	seminar_head = models.CharField(max_length=45)
	venue = models.CharField(max_length=45)

	def __str__(self):
		return self.title

class SeminarConducted(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	month = models.DateField('%m')
	year = models.DateField('%Y')
	position = models.CharField(max_length=45)
	title = models.CharField(max_length=45)
	seminar_head = models.CharField(max_length=45)
	venue = models.CharField(max_length=45)

	def __str__(self):
		return self.title

class TelephoneNumber(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	number = models.CharField(max_length=20)

	def __str__(self):
		return self.number

class UserProfile(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	first_name = models.CharField(max_length=45)
	middle_initial = models.CharField(max_length=45)
	last_name = models.CharField(max_length=45)
	email = models.CharField(max_length=45)
	objective = models.TextField(blank=True, null=True)
	background = models.TextField()

	def __str__(self):
		return self.first_name

class WorkExperience(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	month_start = models.DateField('%m')
	#year_start = models.CharField(max_length=4)
	month_finish= models.DateField('%m')
	year_finish= models.DateField('%Y')
	position = models.CharField(max_length=45)
	company = models.CharField(max_length=45)
	workdone = models.TextField()

	def __str__(self):
		return self.company
