# MS-USERS

This repository contains a Ruby on Rails project designed to run as a dockerized microservice that presents a REST API.

To run this project, deploy it on a suitable Docker Container

`docker-compose build`

`docker-compose up`

or deploy it locally like an usual Ruby on Rails project

`rails server -b "0.0.0.0" `

The Gemfile and Docker image used agree on using Ruby version 2.4.4, and as such, to run this project locally, this version is required.

Once the project is deployed, the database must be started. From another console, run the following commands:

`docker-compose run users-ms rake db:create`

`docker-compose run users-ms rake db:migrate`

The main table 'Users' was generated as a rails scaffold, as such, it includes a model (/app/models/user.rb) and a controller (/app/controllers/users_controller.rb) without a view (due to being an API)
