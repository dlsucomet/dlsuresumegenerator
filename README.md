# dlsuresumegenerator
This project aims to simplify the process in making resumes in the DLSU format and provide a way for students to track the seminars that they have taken.

# Pre-requisites
The following dependencies are needed:
1. Python 2.7
2. virtualenvwrapper
3. Pip
4. Django
5. Database Dependencies (not yet ready)

# Setup
For in-depth instructions, refer to the official Django documentation:
https://docs.djangoproject.com/en/1.9/intro/install/

1. Set up Python 2.7 and virtualenvwrapper on your machine.
2. Create a new virtual environment using virtualenvwrapper.
3. Use Pip to install Django and the other dependencies inside the virtualenv.
2. Pull the latest version of the dlsuresumegenerator to an easily accessible place
3. Once you have created the virtual environment, type in the following: setvirtualenvproject $virtualenv_path $project_path , where $virtualenv_path is the path of your virtual env and $project_path is the path of the dlsuresumegenerator repository on your machine.
4. After that, the project can now be run whenever you're in the virtual environment using the following command: python manage.py runserver
