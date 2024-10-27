class Deposit < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :orders
  has_many :stocks
  has_many :products, through: :stocks
end
