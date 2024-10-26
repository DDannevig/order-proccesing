# frozen_string_literal: true

class Deposit < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :orders
end