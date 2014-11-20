#!/bin/bash

echo -n "Heroku app name: "
read appname

# Clean up app name to least common denominator of syntax (no hyphens, lowercase)
herokugitremote="git@heroku.com:$appname.git"
liveurl="$appname.herokuapp.com"
appname="${appname//-/}"
appname="$(echo $appname | tr '[A-Z]' '[a-z]')"

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

# git add -A
# git commit -am "Adding arbiter instants bootstrapped files"
# git remote add heroku $herokugitremote
# git push heroku master

printf "You are now bootstrapped!"
printf "\n"
printf "To run the app locally:"
printf "foreman start"
printf "\n"
printf "You app is live at: $liveurl"


# push to heroku
# Print the localhost url
# Print the live url - arbiter-instants.herokuapp.com
# install django rest
# modify the settings file


