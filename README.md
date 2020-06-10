## model: task

* id    :bigint
* name  :string(255)
* description  :text(65535)
# rails (6.0.3.1)
* rails db:migrate:redo
## heroku
* heroku create
* git push heroku master
* heroku run rails db:migrate
* heroku open
* heroku run rake assets:precompile
* heroku restart
* heroku logs -t
* heroku pg:reset DATABASE
* heroku run rails db:reset
* heroku run rake db:seed