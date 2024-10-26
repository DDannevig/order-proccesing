# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :identifier, presence: true, uniqueness: true

  has_many :stocks
  has_many :order_products
  has_many :orders, through: :order_products
end
