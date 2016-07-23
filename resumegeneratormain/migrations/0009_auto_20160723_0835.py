# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2016-07-23 00:35
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('resumegeneratormain', '0008_auto_20160723_0833'),
    ]

    operations = [
        migrations.CreateModel(
            name='EducationAward',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('award_description', models.CharField(blank=True, max_length=45, null=True)),
                ('award_date', models.CharField(blank=True, max_length=45, null=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.RemoveField(
            model_name='education',
            name='award_date',
        ),
        migrations.RemoveField(
            model_name='education',
            name='award_description',
        ),
    ]