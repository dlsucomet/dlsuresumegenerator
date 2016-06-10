from django.contrib import admin

from .models import Achievements
from .models import Address
from .models import Award
from .models import Cellphone
from .models import Curricular
from .models import Education
from .models import Login
from .models import Researchpaper
from .models import Seminarattend
from .models import Seminarconduct
from .models import Telephone
from .models import User
from .models import Workexp

# Register your models here.
admin.site.register(Achievements)
admin.site.register(Address)
admin.site.register(Award)
admin.site.register(Cellphone)
admin.site.register(Curricular)
admin.site.register(Education)
admin.site.register(Login)
admin.site.register(Researchpaper)
admin.site.register(Seminarattend)
admin.site.register(Seminarconduct)
admin.site.register(Telephone)
admin.site.register(User)
admin.site.register(Workexp)
