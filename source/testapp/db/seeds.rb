# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# To create 4 customers
Customer.create(first_name: "Johny", last_name: "Flow")
Customer.create(first_name: "Raj", last_name: "Jamnis")
Customer.create(first_name: "Andrew", last_name: "Chung")
Customer.create(first_name: "Mike", last_name: "Smith")

# To create 20 transactions
Charge.create(paid: true, amount: 4900, currency: "usd", refunded: false, customer_id: 1)
Charge.create(paid: true, amount: 4800, currency: "usd", refunded: false, customer_id: 1)
Charge.create(paid: true, amount: 4700, currency: "usd", refunded: false, customer_id: 1)
Charge.create(paid: true, amount: 4600, currency: "usd", refunded: false, customer_id: 1)
Charge.create(paid: true, amount: 4500, currency: "usd", refunded: false, customer_id: 1)

Charge.create(paid: true, amount: 4400, currency: "usd", refunded: false, customer_id: 2)
Charge.create(paid: true, amount: 4300, currency: "usd", refunded: false, customer_id: 2)
Charge.create(paid: true, amount: 4200, currency: "usd", refunded: false, customer_id: 2)
Charge.create(paid: true, amount: 4100, currency: "usd", refunded: false, customer_id: 3)
Charge.create(paid: true, amount: 4000, currency: "usd", refunded: false, customer_id: 4)

Charge.create(paid: false, amount: 5900, currency: "usd", refunded: false, customer_id: 3)
Charge.create(paid: false, amount: 5800, currency: "usd", refunded: false, customer_id: 3)
Charge.create(paid: false, amount: 5700, currency: "usd", refunded: false, customer_id: 3)
Charge.create(paid: false, amount: 5600, currency: "usd", refunded: false, customer_id: 4)
Charge.create(paid: false, amount: 5500, currency: "usd", refunded: false, customer_id: 4)

Charge.create(paid: true, amount: 5400, currency: "usd", refunded: true, customer_id: 1)
Charge.create(paid: true, amount: 5300, currency: "usd", refunded: true, customer_id: 1)
Charge.create(paid: true, amount: 5200, currency: "usd", refunded: true, customer_id: 1)
Charge.create(paid: true, amount: 5100, currency: "usd", refunded: true, customer_id: 2)
Charge.create(paid: true, amount: 5000, currency: "usd", refunded: true, customer_id: 2)
