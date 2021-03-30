class Order < ApplicationRecord
  validates :amount, presence: true, numericality: true
  validates :merchant_id, presence: true
  validates :shopper_id, presence: true

  belongs_to :merchant
  belongs_to :shopper
end
