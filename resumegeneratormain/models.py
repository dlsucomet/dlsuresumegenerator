from django.db import models
from django.contrib.auth.models import User

class Achievement(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	name = models.CharField(max_length=100)

	def __str__(self):
		return 'User: {} {}'.format(self.user.last_name, self.user.first_name)

class Address(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	address_line_one = models.TextField()
	address_line_two = models.TextField()

	def __str__(self):
		return 'User: {} {}'.format(self.user.last_name, self.user.first_name)

class CellphoneNumber(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	number = models.CharField(max_length=20)

	def __str__(self):
		return 'User: {} {}'.format(self.user.last_name, self.user.first_name)

class ExtraCurricular(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	organization = models.CharField(max_length=45)
	position = models.CharField(max_length=45)
	work_done = models.TextField()
	year_start = models.DateField(max_length=4)
	year_finish = models.DateField(max_length=4)

	def __str__(self):
		return 'User: {} {}'.format(self.user.last_name, self.user.first_name)

class Education(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	school = models.CharField(max_length=45)
	education_attained = models.CharField(max_length=45)
	year_start = models.DateField(max_length=4)
	year_finish= models.DateField(max_length=4)
	month_attained = models.DateField(max_length=3)
	year_attained = models.DateField(max_length=4)

	def __str__(self):
		return 'User: {} {}'.format(self.user.last_name, self.user.first_name)

class EducationAward(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
	school = models.ForeignKey(Education, on_delete=models.CASCADE, null=True)
	award_description = models.CharField(max_length=45, blank=True, null=True)
	award_date = models.DateField(max_length=4, blank=True, null=True)

	def __str__(self):
		return 'User: {} {}'.format(self.user.last_name, self.user.first_name)

class ResearchPaper(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	month = models.CharField(max_length=3)
	year = models.CharField(max_length=4)
	title = models.CharField(max_length=70)
	summary = models.TextField()

	def __str__(self):
		return 'User: {} {}'.format(self.user.last_name, self.user.first_name)

class SeminarAttended(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	month = models.CharField(max_length=3)
	year = models.CharField(max_length=4)
	title = models.CharField(max_length=45)
	seminar_head = models.CharField(max_length=45)
	venue = models.CharField(max_length=45)

	def __str__(self):
		return 'User: {} {}'.format(self.user.last_name, self.user.first_name)

class SeminarConducted(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	month = models.CharField(max_length=3)
	year = models.CharField(max_length=4)
	position = models.CharField(max_length=45)
	title = models.CharField(max_length=45)
	seminar_head = models.CharField(max_length=45)
	venue = models.CharField(max_length=45)

	def __str__(self):
		return 'User: {} {}'.format(self.user.last_name, self.user.first_name)

class TelephoneNumber(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	number = models.CharField(max_length=20)

	def __str__(self):
		return 'User: {} {}'.format(self.user.last_name, self.user.first_name)

class UserProfile(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	first_name = models.CharField(max_length=45)
	middle_initial = models.CharField(max_length=45)
	last_name = models.CharField(max_length=45)
	email = models.CharField(max_length=45)
	objective = models.TextField(blank=True, null=True)
	background = models.TextField()

	def __str__(self):
		return 'User: {} {}'.format(self.user.last_name, self.user.first_name)

class WorkExperience(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	month_start = models.CharField(max_length=3)
	#year_start = models.CharField(max_length=4)
	month_finish= models.CharField(max_length=3)
	year_finish= models.CharField(max_length=4)
	position = models.CharField(max_length=45)
	company = models.CharField(max_length=45)
	workdone = models.TextField()

	def __str__(self):
		return 'User: {} {}'.format(self.user.last_name, self.user.first_name)
