# README

## Steps to Install:
1. cd to project folder
2. bundle install
3. rails g model User name email password_digest plan
4. rails db:migrate

## Import Data from JSON files
5. source auto.sh

## Run Server
6. rails s

## Create user from rails console
7. Rails c
8. User.create!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')

(after creating user exit rails console, user can also be created by post request to the user API)

## Get Authentication Token
9. curl -H "Content-Type: application/json" -X POST -d '{"email":"example@mail.com","password":"123123123"}' http://localhost:3000/authenticate

## Make API request using Authentication Token
10. curl -H "Authorization: <-- put auth token here -->" http://localhost:3000/actors
