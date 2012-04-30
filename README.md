# Heroku Autoscaler

Runs autoscale requests every minute to the Heroku app of your choice.
See [Heroku autoscale gem](https://yhourdel@github.com/yhourdel/heroku-autoscale.git) to setup your app for autoscaling.

## Setup

### 1. Create a new Heroku app

heroku create --stack cedar

### 2. Configure this app with your settings

```shell
heroku config:add AUTOSCALE_URL=<your autoscale URL (e.g.: http://www.example.com/autoscale/123456789)>
heroku config:add GMAIL_DOMAIN=<your domain (e.g.: example.com)>
heroku config:add GMAIL_USERNAME=<your email (e.g.: foo@example.com)>
heroku config:add GMAIL_PASSWORD=<your password (e.g.: foo1234)>
heroku config:add EXC_RECIPIENTS=<recipients for exceptions notification (e.g.: me@example.com)>
```

### 3. Push this app on Heroku

```shell
git push heroku master
```

### 4. Don't forget to scale down your web app

```shell
heroku scale web=0
```

### 5. Then scale up your worker

```shell
heroku scale worker=1
```

