# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by example.

## What does it do?
!["Home"](https://github.com/karen1au/jungle-rails/blob/master/doc/home.png?raw=true)
See a list of products available on Jungle!

!["Details"](https://github.com/karen1au/jungle-rails/blob/master/doc/details.png?raw=true)
Checkout the details for each product and post review to the product!

!["Cart"](https://github.com/karen1au/jungle-rails/blob/master/doc/cart.png?raw=true)
Start shopping and add product to your cart. You can add or remove item inside the cart page.

!["Order"](https://github.com/karen1au/jungle-rails/blob/master/doc/order.png?raw=true)
Keep track of what you ordered at the order details page, a confirmation email will also be emailed to you.

!["Admin"](https://github.com/karen1au/jungle-rails/blob/master/doc/admin.png?raw=true)
For admin of Jungle, managing products and categories is a breeze!

#### Happy Shopping!

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
5. Run `bin/rake db:reset` to create, load and seed db
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* bcrypt
* font-awesome-rails
