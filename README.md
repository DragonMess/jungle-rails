# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

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
- bcrypt 3.1.7

## Test Dependencies

- rspec-rails
- capybara
- poltergeist

## Final Product

Home - Products

!["Load"](./Docs/Home.png)

Categories - Apparel

!["Load"](./Docs/Home-Apparel.png)

Categories - Furniture

!["Load"](./Docs/Home_Furniture.png)

Categories - Electronics

!["Load"](./Docs/Home-Electronics.png)

About

!["Load"](./Docs/About.png)

Cart

!["Load"](./Docs/Cart.png)

Cart - checkout

!["Load"](./Docs/checkout-Cart.png)

Admin - options

!["Load"](./Docs/Admin-options.png)

Admin - Dashboard

!["Load"](./Docs/Admin-Dashboard.png)

Admin - Products

!["Load"](./Docs/Admin-Products.png)

Admin - Categories

!["Load"](./Docs/Admin-Categories.png)

Login

!["Load"](./Docs/Login.png)

Sign up

!["Load"](./Docs/Sign-Up.png)

Signed

!["Load"](./Docs/Signed.png)
