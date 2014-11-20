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

# Create a superuser
echo -n "You are about to create the django superuser for your local environment. This will be your login credentials for accessing django admin at localhost:5000/admin/. Press enter to continue."
read empty
python manage.py createsuperuser

# Update the settings for django REST framework and add the api app to settings
OLD_LAST_LINE="'django.contrib.staticfiles',"
NEW_LAST_LINE="'django.contrib.staticfiles', 'rest_framework', 'api',"
f="$appname/settings.py"
sed "s/$OLD_LAST_LINE/$NEW_LAST_LINE/g" "$f" > "$f.new" && mv "$f.new" "$f"
echo "
REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': ('rest_framework.permissions.AllowAny',),
    'PAGINATE_BY': 10
}" >> $appname/settings.py
python manage.py migrate


# Add the api urls to the <appname>/urls.py
ADMIN_LINE="url(r'^admin/', include(admin.site.urls)),"
ADMIN_AND_API_LINE="url(r'^admin/', include(admin.site.urls)), url(r'^api/', include('api.urls', namespace='api'),),"
f="$appname/urls.py"
sed "s;$ADMIN_LINE;$ADMIN_AND_API_LINE;g" "$f" > "$f.new" && mv "$f.new" "$f"



# Commit everything and push to heroku and github
git add -A
git commit -am "Adding arbiter instants bootstrapped files"
git push origin master
git remote add heroku $herokugitremote
git push heroku master
heroku run python manage.py migrate

printf "You are now bootstrapped!"
printf "Run the app locally at localhost:5000 using:"
printf "foreman start"
printf "Visit your live app at: $liveurl"

# install django rest
# modify the settings file


