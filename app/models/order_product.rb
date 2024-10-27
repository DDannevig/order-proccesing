class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :product, :order, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
