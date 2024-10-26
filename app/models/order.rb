# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :deposit
  has_many :order_products
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products

  enum status: { pending: 0, prepared: 1, fulfilled: 2 }

  validates :identifier, uniqueness: true
  validates :status, :deposit, presence: true

  after_create :reload
end
