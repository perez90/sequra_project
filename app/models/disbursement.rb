class Disbursement < ApplicationRecord
  validates :amount, presence: true, numericality: true
  validates :year, presence: true, numericality: true
  validates :week, presence: true,uniqueness: {scope: %i[merchant_id year] }, numericality: true

  belongs_to :merchant
  has_many :orders, dependent: :destroy
end
