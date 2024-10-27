class Stock < ApplicationRecord
  validates :quantity, :deposit, :product, presence: true

  belongs_to :deposit
  belongs_to :product
end
