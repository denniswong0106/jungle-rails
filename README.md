# Jungle

A mini e-commerce application built with Rails 4.2, using an Error Driven development (EDD) approach.

Techs Used: Ruby on Rails, POSTGresSQL, RSpec, Capybara, Poltergeist

This educational Project is Lighthouse Labs, starting project here: https://github.com/lighthouse-labs/jungle-rails/

## App Features

Show all products on homepage - note the SOLD OUT badge on sold out items.

!["homepage"](https://github.com/denniswong0106/jungle-rails/blob/master/public/images/homepage.png?raw=true)

Create new account and login functions
!["create user/login user"](https://github.com/denniswong0106/jungle-rails/blob/master/public/images/createuser_and_login.gif?raw=true)

Additional authentication for admin users to access admin pages
!["Admin authentication"](https://github.com/denniswong0106/jungle-rails/blob/master/public/images/authenticate.png?raw=true)

Add to cart feature
!["Add to cart"](https://github.com/denniswong0106/jungle-rails/blob/master/public/images/add-items-cart.gif?raw=true)

Payment with stripe API
!["Payment with stripe"](https://github.com/denniswong0106/jungle-rails/blob/master/public/images/payment_stripe.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
