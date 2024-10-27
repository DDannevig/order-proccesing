FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    identifier { SecureRandom.uuid }
  end
end
