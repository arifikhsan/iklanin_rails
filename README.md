# Iklanin Rails

## Commands

### heroku clean

heroku restart && heroku pg:reset DATABASE --confirm iklanin && heroku run rake db:migrate

### seed on heroku

heroku restart --app=iklanin && heroku pg:reset DATABASE --confirm iklanin --app=iklanin && heroku run rake db:migrate db:seed --app=iklanin 

### migrate and seed on heroku

heroku run rake db:migrate db:seed --app=iklanin 

heroku run console --app=iklanin 
heroku run bash --app=iklanin 

### rebuild database locally

rake db:drop db:create db:migrate
rake db:drop db:create db:migrate db:seed
rake db:seed

### logs

heroku logs --tail --app iklanin

### secret key

EDITOR=vim rails credentials:edit
rails:credentials:show
