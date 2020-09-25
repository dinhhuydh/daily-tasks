# README

Mini daily tasks

## Demo site
https://mini-daily-tasks.herokuapp.com/

## Ruby version
2.7.1

## Rails version
5.1.7


## Database creation

## Database initialization

## How to run the test suite
- Install geckodriver for Firefox driver
- Install node version > 6.9
- run `rspec`

## Development setup
- Configure postgres credentials in database.yml
- rake db:create
- rake db:migrate
- run `rails s` and access localhost:3000

## Docker
- Run `docker-compose build`
- Run `docker-compose up web`
- Run `docker-compose exec web rake db:create db:migrate` to set up database
- Access `localhost:3000`

## TODO
- Setup test environment on docker. It misses shouda-matchers gem in test enviroment on Docker which is in development environment.
