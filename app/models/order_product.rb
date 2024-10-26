# frozen_string_literal: true

class OrderProduct < ApplicationRecord
  validates :quantity, :product, :order, presence: true

  belongs_to :order
  belongs_to :product
end
