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
order_1 = Order.create(deposit: deposit_1)
order_2 = Order.create(deposit: deposit_2)
order_3 = Order.create(deposit: deposit_1)

FactoryBot.create_list :order, 500

# Stock
Stock.create(deposit: deposit_1, product: product_1)
Stock.create(deposit: deposit_1, product: product_2, quantity: 100)
Stock.create(deposit: deposit_2, product: product_3, quantity: 50)
Stock.create(deposit: deposit_2, product: product_4, quantity: 125)
Stock.create(deposit: deposit_2, product: product_1, quantity: 30)
Stock.create(deposit: deposit_2, product: product_2, quantity: 25)

# OrderProducts
OrderProduct.create(order: order_1, product: product_2, quantity: 5)
OrderProduct.create(order: order_2, product: product_3, quantity: 9)
OrderProduct.create(order: order_2, product: product_1, quantity: 1)
OrderProduct.create(order: order_2, product: product_4, quantity: 2)
OrderProduct.create(order: order_2, product: product_2, quantity: 6)
OrderProduct.create(order: order_3, product: product_1, quantity: 2)