# README
# Instagram Clone
This is a Instagram clone App.
## Prerequisits
  * Git
  * rails: 5.2
  * ruby: 2.7.2
  * PostgreSQL 14.4
## Clone the Repository and move to project directory
  * git clone https://github.com/Asad170170/Instagram_app.git
  * cd Instagram_app
## Install Dependencies
  * bundle
## Create and Migrate Database
  * Run the following command to create and migrate the database
  * rails db:create
  * rails db:migrate
## Start the rails server to make the app running
  * Run the following command to start the server
  * rails s
  * Now your server is up and running
  * Go to your browser and go to the following address
  * http://localhost:3000/
## Deploying app on heroku
  * you can deploy your app on heoroku by directly connection your Github with heroku or you can also use heroku cli to upload
  * your app.
### Deploying app on heroku directly from Github
  * go to heroku.com create an account over there
  * create a new app
  * go to deploy section of newly created app
  * select connect github
  * select repository and stable branch
  * press deploy branch
  * after deploying branch more > Run console and run command rails db:migrate
  * now you are good to go
### Deploying app on heroku using heroku cli
  * Install the Heroku CLI
  * If you haven't already, log in to your Heroku account and follow the prompts to create a new SSH public key.
      $ heroku login
  * Clone the repository
      $ heroku git:clone -a devising-instagram-clone-asad2
      $ cd devising-instagram-clone-asad2
  * Deploy your changes
      $ git add .
      $ git commit -am "make it better"
      $ git push heroku master
### After deploying as i am using background jobs run redis server on heroku for free.
 * go to resources and search for redis heroku and add this add-on
 * this add-on is completely free
 * Heroku will ask for you card varification add a valid card info and you are good to go
 * go to your project folder and create a file "Procfile" and past following code in it
    web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
    worker: sidekiq
    release: bin/rails db:migrate

