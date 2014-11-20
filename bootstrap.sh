#!/bin/bash

echo -n "Heroku app name: "
read appname

# Clean up app name to least common denominator of syntax (no hyphens, lowercase)
appname="${appname//-/}"
appname="$(echo $appname | tr '[A-Z]' '[a-z]')"

echo $appname

# Setup the virtual environment
virtualenv venv
source venv/bin/activate

# Create the database
psql -c "CREATE DATABASE $appname"

# Write the Procfile
echo "web: gunicorn $appname.wsgi" > Procfile

# Install the requirements
pip install -r requirements.txt

# Create the django app
django-admin.py startproject  $appname .
python manage.py migrate


# push to heroku
# Print the localhost url
# Print the live url - arbiter-instants.herokuapp.com
# install django rest
# modify the settings file


