instants
========

Instantly setup an instance. The goal of this repo is to provide enough bootstrap code to get a usable server up and running that client side programmer can get up and running in minutes.

# Requirements
This assumes your dev machine has the standard python dev environment ready.

* [pip](http://pip.readthedocs.org/en/latest/installing.html)
* [virtualenv](http://virtualenv.readthedocs.org/en/latest/virtualenv.html#installation)
* [postgres](http://postgresapp.com)

# Setup
* Fork this repo and clone it locally.
* [Create a new heroku instance](https://dashboard-next.heroku.com/new)
* Make note of the name of the app. You'll be asked to enter it later.
* Run `. ./bootstrap.sh`
* Pay attention. You will be prompted to answer a few config questions
* Done!

Use `foreman start` to run your app locally at localhost:5000
Your app will be live at `your-heroku-app-name.herokuapp.com`

# Disclaimers
* The default settings are not suitable for production. Be sure to apply to standard django production steps before using this in production.

# Links
* [django](https://docs.djangoproject.com/en/1.7/)
* [Django REST framework](http://www.django-rest-framework.org)
