# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = True` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class Achievements(models.Model):
    achieveid = models.AutoField(db_column='achieveID', primary_key=True)  # Field name made lowercase.
    userid = models.IntegerField(db_column='userID')  # Field name made lowercase.
    achievement = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'Achievements'


class Address(models.Model):
    addressid = models.AutoField(db_column='addressID', primary_key=True)  # Field name made lowercase.
    userid = models.IntegerField(db_column='userID')  # Field name made lowercase.
    address = models.TextField()

    class Meta:
        managed = True
        db_table = 'Address'


class Award(models.Model):
    awardid = models.AutoField(db_column='awardID', primary_key=True)  # Field name made lowercase.
    userid = models.IntegerField(db_column='userID')  # Field name made lowercase.
    award = models.TextField()
    yearaward = models.CharField(db_column='yearAward', max_length=4)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'Award'


class Cellphone(models.Model):
    cellphoneid = models.AutoField(db_column='cellphoneID', primary_key=True)  # Field name made lowercase.
    userid = models.IntegerField(db_column='userID')  # Field name made lowercase.
    cellnum = models.CharField(db_column='cellNum', max_length=20)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'Cellphone'


class Curricular(models.Model):
    curricularid = models.AutoField(db_column='curricularID', primary_key=True)  # Field name made lowercase.
    userid = models.IntegerField(db_column='userID')  # Field name made lowercase.
    yrstart = models.CharField(db_column='yrStart', max_length=4)  # Field name made lowercase.
    yrfin = models.CharField(db_column='yrFin', max_length=4)  # Field name made lowercase.
    position = models.CharField(max_length=45)
    organization = models.CharField(max_length=45)
    workdone = models.TextField(db_column='workDone')  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'Curricular'


class Education(models.Model):
    educationid = models.AutoField(db_column='educationID', primary_key=True)  # Field name made lowercase.
    userid = models.IntegerField(db_column='userID')  # Field name made lowercase.
    yrstart = models.IntegerField(db_column='yrStart')  # Field name made lowercase.
    yrfin = models.IntegerField(db_column='yrFin')  # Field name made lowercase.
    school = models.CharField(max_length=45)
    educattained = models.CharField(db_column='educAttained', max_length=45)  # Field name made lowercase.
    monthattained = models.CharField(db_column='monthAttained', max_length=45)  # Field name made lowercase.
    yearattained = models.CharField(db_column='yearAttained', max_length=45)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'Education'


class Login(models.Model):
    userid = models.IntegerField(db_column='userID', primary_key=True)  # Field name made lowercase.
    username = models.CharField(max_length=45)
    password = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'LogIn'


class Researchpaper(models.Model):
    researchpaperid = models.AutoField(db_column='researchPaperID', primary_key=True)  # Field name made lowercase.
    userid = models.IntegerField(db_column='userID')  # Field name made lowercase.
    month = models.CharField(max_length=45)
    year = models.CharField(max_length=4)
    title = models.CharField(max_length=70)
    summary = models.TextField()

    class Meta:
        managed = True
        db_table = 'ResearchPaper'


class Seminarattend(models.Model):
    seminarattendid = models.AutoField(db_column='seminarAttendID', primary_key=True)  # Field name made lowercase.
    userid = models.IntegerField(db_column='userID')  # Field name made lowercase.
    month = models.CharField(max_length=45)
    year = models.CharField(max_length=4)
    title = models.CharField(max_length=45)
    seminarhead = models.CharField(db_column='seminarHead', max_length=45)  # Field name made lowercase.
    venue = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'SeminarAttend'


class Seminarconduct(models.Model):
    seminarconductid = models.AutoField(db_column='seminarConductID', primary_key=True)  # Field name made lowercase.
    userid = models.IntegerField(db_column='userID')  # Field name made lowercase.
    month = models.CharField(max_length=45)
    year = models.CharField(max_length=4)
    position = models.CharField(max_length=45)
    title = models.CharField(max_length=45)
    seminarhead = models.CharField(db_column='seminarHead', max_length=45)  # Field name made lowercase.
    venue = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'SeminarConduct'


class Telephone(models.Model):
    telephoneid = models.AutoField(db_column='telephoneID', primary_key=True)  # Field name made lowercase.
    userid = models.IntegerField(db_column='userID')  # Field name made lowercase.
    telnum = models.CharField(db_column='telNum', max_length=20)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'Telephone'


class User(models.Model):
    userid = models.AutoField(db_column='userID', primary_key=True)  # Field name made lowercase.
    firstname = models.CharField(db_column='firstName', max_length=45)  # Field name made lowercase.
    middleinitial = models.CharField(db_column='middleInitial', max_length=45)  # Field name made lowercase.
    lastname = models.CharField(db_column='lastName', max_length=45)  # Field name made lowercase.
    email = models.CharField(max_length=45)
    objective = models.TextField(blank=True, null=True)
    background = models.TextField()

    class Meta:
        managed = True
        db_table = 'User'


class Workexp(models.Model):
    workexpid = models.AutoField(db_column='workExpID', primary_key=True)  # Field name made lowercase.
    userid = models.IntegerField(db_column='userID')  # Field name made lowercase.
    monthstart = models.CharField(db_column='monthStart', max_length=45)  # Field name made lowercase.
    yearstart = models.CharField(db_column='yearStart', max_length=4)  # Field name made lowercase.
    monthfin = models.CharField(db_column='monthFin', max_length=45)  # Field name made lowercase.
    yearfin = models.CharField(db_column='yearFin', max_length=4)  # Field name made lowercase.
    position = models.CharField(max_length=45)
    company = models.CharField(max_length=45)
    workdone = models.TextField(db_column='workDone')  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'WorkExp'

#
# class DjangoMigrations(models.Model):
#     app = models.CharField(max_length=255)
#     name = models.CharField(max_length=255)
#     applied = models.DateTimeField()
#
#     class Meta:
#         managed = True
#         db_table = 'django_migrations'
