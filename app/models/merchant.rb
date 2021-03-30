class Merchant < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with:  /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/  }
  validates :cif, presence: true, uniqueness: true
end
