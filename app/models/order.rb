# frozen_string_literal: true

class Order < ApplicationRecord
  validates :identifier, uniqueness: true
  validates :status, :deposit, presence: true

  belongs_to :deposit
  has_many :order_products
  has_many :products, through: :order_products

  enum status: { pending: 0, prepared: 1, fulfilled: 2 }
end