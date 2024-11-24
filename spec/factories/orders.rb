FactoryBot.define do
  factory :order do
    deposit { Deposit.all.sample }

    after :create do |order|
      create_list :order_product, 5, order: order
    end
  end
end
