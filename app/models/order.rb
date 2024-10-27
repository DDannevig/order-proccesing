class Order < ApplicationRecord
  belongs_to :deposit
  has_many :order_products
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products

  enum status: { pending: 0, prepared: 1 }

  validates :identifier, uniqueness: true
  validates :status, :deposit, presence: true

  validate :pending_status?, on: :update

  after_create :reload

  def pending_status?
    return if status_was == 'pending'

    errors.add(:order_not_pending, I18n.t('models.order.errors.not_pending'))
  end
end
