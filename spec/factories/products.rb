FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    identifier { Faker::Lorem.word }
  end
end
