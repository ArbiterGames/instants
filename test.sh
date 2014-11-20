#!/bin/bash

echo -n "Heroku app name: "
read appname

# Clean up app name to least common denominator of syntax (no hyphens, lowercase)
herokugitremote="git@heroku.com:$appname.git"
liveurl="$appname.herokuapp.com"
appname="${appname//-/}"
appname="$(echo $appname | tr '[A-Z]' '[a-z]')"

git add -A
git commit -am "Adding arbiter instants bootstrapped files"
git remote add heroku $herokugitremote
git push heroku master


printf "You are now bootstrapped!"
printf "\n"
printf "To run the app locally:"
printf "foreman start"
printf "\n"
printf "You app is live at: $liveurl"
