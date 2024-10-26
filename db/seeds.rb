# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Products
product_1 = Product.create(name: 'Coca Cola 2lt', identifier: 'cc2')
product_2 = Product.create(name: 'Coca Cola 1.5lt', identifier: 'cc1.5')
product_3 = Product.create(name: 'Papas Fritas 100g', identifier: 'pp100')
product_4 = Product.create(name: 'Papas Fritas 250g', identifier: 'pp250')
Product.create(name: 'Guacamole 100g', identifier: 'g100')
Product.create(name: 'Guacamole 200', identifier: 'g200')

# Deposits
deposit_1 = Deposit.create(name: 'V. Maipu')
deposit_2 = Deposit.create(name: 'C. Rodriguez')

# Orders
Order.create(deposit: deposit_1)
Order.create(deposit: deposit_2)

# Stock
Stock.create(deposit: deposit_1, product: product_1)
Stock.create(deposit: deposit_1, product: product_2, quantity: 100)
Stock.create(deposit: deposit_2, product: product_3, quantity: 50)
Stock.create(deposit: deposit_2, product: product_4, quantity: 125)