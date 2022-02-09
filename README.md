# Jungle

A mini e-commerce application built with Rails 4.2 that allows users to buy items of thier choice and admins to create products and categories. At the home page users are met with all products, products can be sorted by category and appear with a sold out badge when quatntity is 0. Admins, once verified using http authentication, can also delete products if they choose. At the cart, users can increase the quantity of a product or remove a product from their cart. After ordering, users are met with a customized thank you message and a list of items they have purchsed. This list contians the product name, image, quantity purchases, and the total cost of that item towards the total order price. Jungle also comes with included model and feature tests using capybara. There is an included 🌴 favicon, but change it up, have fun, and make it yours!

## Final Product

## Additional Steps for VM Machines

1. Make sure that you are runnning Ruby 2.3.5 (`ruby -v`)
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://github.com/lighthouse-labs/jungle-rails/blob/master/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s` to start the server or `bin/rails s -b 0.0.0.0` on your VM

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* spring
* Stripe
* bcrypt-3.1.7
* capybara
* poltergeist

## Run Capybara tests
`bin/rspec`
