FactoryBot.define do
  factory :order_product do
    quantity { Faker::Number.between(from: 1, to: 10) }
    order
    product { Product.all.sample }
  end
end
