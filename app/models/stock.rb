class Stock < ApplicationRecord
  validates :quantity, :deposit, :product, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :deposit
  belongs_to :product
end
