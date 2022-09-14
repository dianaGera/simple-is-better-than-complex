# About
Nov 2021
This project was created following by [Simple is better than complex](https://simpleisbetterthancomplex.com/) lessons 

+additional tutorials from this resource

I learnt: 
* Django (basic), Django Unit Test, Celery, Shell, Docker, JavaScript, 
* Crop Images, adding multiple users, upload multiple files, 
* Reset password, SendEmail, crispyForm, allauth
* recaptcha, PDF and CSV export, history log


# Build the project


## Build the project using Docker

Build, run and stop docker:

```bash
# build docker image
sudo docker-compose -f docker-compose.yml build

# run docker image
sudo docker-compose -f docker-compose.yml up -d

# stop docker image
sudo docker-compose -f docker-compose.yml down
```
###### (Remove sudo if command <sudo> not found. Remove <-d> to see logs)


Build, run and stop docker using Makefile:

```bash
# build docker image
make build-dev

# run docker image
make run-dev

# stop docker image
make down-dev
```


# Celery

#run celery: celery -A myproject worker -l info
#run celery flower: celery flower --port=5555