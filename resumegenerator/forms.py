from django import forms
from models import Achievements

class AchievementsForm(forms.ModelForm):

	class Meta:
		model = Achievements
