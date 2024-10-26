# frozen_string_literal: true

class Order < ApplicationRecord
  validates :identifier, uniqueness: true
  validates :status, presence: true

  belongs_to :deposit

  enum status: { pending: 0, prepared: 1, fulfilled: 2 }
end
