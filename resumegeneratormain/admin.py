from django.contrib import admin
from reversion.admin import VersionAdmin

from .models import *

class YourModelAdmin(VersionAdmin):
    pass


admin.site.register(Achievement, YourModelAdmin)
admin.site.register(Address, YourModelAdmin)
admin.site.register(CellphoneNumber, YourModelAdmin)
admin.site.register(ExtraCurricular, YourModelAdmin)
admin.site.register(Education, YourModelAdmin)
admin.site.register(EducationAward, YourModelAdmin)
admin.site.register(ResearchPaper, YourModelAdmin)
admin.site.register(SeminarAttended, YourModelAdmin)
admin.site.register(SeminarConducted, YourModelAdmin)
admin.site.register(TelephoneNumber, YourModelAdmin)
admin.site.register(UserProfile, YourModelAdmin)
admin.site.register(WorkExperience, YourModelAdmin)
