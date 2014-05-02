SponsorPay Exercise
====

This is a simple solution for SponsorPay exercise. 

You can checkout [My Solution](http://sponsorpay-exercise.herokuapp.com) live at (http://sponsorpay-exercise.herokuapp.com).

How to run the tests:
---
    bundle exec rake spec

Technologies used
---

 - Ruby (-v 2.0)
 - Ruby on Rails (-v 4.0.4)
 - jQuery
 - Rspec/Capybara/Selenium
 - Twitter Bootstrap


Steps to run it locally:
---
    bundle exec rake db:migrate
    bundle exec rails s


Notes:
---

- I chose Rails 4 for this exercise for simplicity, but usually in production mode I use Sinatra/Grape/Rack for simple API calls. 

- I'm using Ruby 2.0 (MRI) for simplicity, usually for production environment I use jRuby implementation with threaded server like Puma.

- I'm using SQLite for simplicity, in production I always prefer to use postgress/MySQL for RDBS (Preferably AWS RDS).

- Please note that I didn't use background workers with Resque/RabbitMQ or even use Celluloid directly for performance enhancements (I didn't consider scalability at this stage).

- I faced some problems getting results as I need a valid Uid so I can get offers. 