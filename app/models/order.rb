class Order < ApplicationRecord
  validates :amount, presence: true, numericality: true
  validates :merchant_id, presence: true
  validates :shopper_id, presence: true

  belongs_to :merchant
  belongs_to :shopper
  belongs_to :disbursement, optional: true

  PERCENTAGE_FEE_FIRST = 0.01
  PERCENTAGE_FEE_SECOND = 0.0095
  PERCENTAGE_FEE_THIRD = 0.0085

  scope :completed, -> { where.not(completed_at: nil) }

  def calculated_amount
    if amount < 50
      amount * (1 - PERCENTAGE_FEE_FIRST)
    elsif amount > 50 && amount < 300
      amount * (1 - PERCENTAGE_FEE_SECOND)
    elsif amount > 300
      amount * (1 - PERCENTAGE_FEE_THIRD)
    end
  end
end
