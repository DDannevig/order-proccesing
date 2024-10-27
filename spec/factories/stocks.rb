FactoryBot.define do
  factory :stock do
    product { FactoryBot.create :product }
    quantity { Faker::Number.between(from: 10, to: 50) }
  end
end
