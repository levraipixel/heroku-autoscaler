heroku-autoscaler
=================

Runs autoscale requests every minute to the Heroku app of your choice.

# Create a new Heroku app
heroku create --stack cedar

# Configure this app with your settings
heroku config:add GMAIL_DOMAIN=<your domain (e.g.: example.com)>
heroku config:add GMAIL_USERNAME=<your email (e.g.: foo@example.com)>
heroku config:add GMAIL_PASSWORD=<your password (e.g.: foo1234)>
heroku config:add EXC_RECIPIENTS=<recipients for exceptions notification (e.g.: me@example.com)>

# Push this app on Heroku
git push heroku master

# Don't forget to scale down your web app
heroku scale web=0
