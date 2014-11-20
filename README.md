instants
========

Instantly setup an instance. The goal of this repo is to provide enough bootstrap code to get a usable server up and running that client side programmer can get up and running in minutes.

#Requirements
This assumes your dev machine has the standard python dev environment ready.

* [pip](http://pip.readthedocs.org/en/latest/installing.html)
* [virtualenv](http://virtualenv.readthedocs.org/en/latest/virtualenv.html#installation)
* [postgres](http://postgresapp.com)

# Setup
* [Create a new heroku instance](https://dashboard-next.heroku.com/new)
* Make note of the name of the app. I'll call this <app name> in the rest of the instructions
* Clone this repo
* Run `. ./bootstrap.sh <app name>`
* Create the heroku instance
* Add the heroku instance as a remote of this repo
* Push

# Links
* [django](https://docs.djangoproject.com/en/1.7/)
* [Django REST framework](http://www.django-rest-framework.org)
