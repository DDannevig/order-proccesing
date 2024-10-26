# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Products
Product.create(name: 'Coca Cola 2lt', identifier: 'cc2')
Product.create(name: 'Coca Cola 1.5lt', identifier: 'cc1.5')
Product.create(name: 'Papas Fritas 100g', identifier: 'pp100')
Product.create(name: 'Papas Fritas 250g', identifier: 'pp250')
Product.create(name: 'Guacamole 100g', identifier: 'g100')
Product.create(name: 'Guacamole 200', identifier: 'g200')

# Deposits
deposit_1 = Deposit.create(name: 'V. Maipu')
deposit_2 = Deposit.create(name: 'C. Rodriguez')

# Orders
Order.create(deposit: deposit_1)
Order.create(deposit: deposit_2)