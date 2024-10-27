FactoryBot.define do
  factory :deposit do
    name { Faker::Movies::StarWars.planet }

    trait :with_stocked_products do
      after :create do |deposit|
        create_list(:stock, 2, deposit: deposit)
      end
    end
  end
end
