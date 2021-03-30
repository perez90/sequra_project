require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  describe 'validations' do
    describe 'associations' do
      it { should belong_to(:merchant) }
      it { should have_many(:orders) }
    end

    describe 'validations' do
      it { should validate_presence_of(:amount) }
    end
  end

  describe 'calculations' do
    before do
      Merchant.destroy_all

      merchant = Merchant.create(name: 'Merchant test', cif: 'E42340869', email: 'merchant_test@gmail.com')
      shopper = Shopper.create(name: 'Shopper test', nif: '88173304K', email: 'shopper_test@gmail.com')

      Order.create(amount: 100, merchant_id: merchant.id, shopper_id: shopper.id, completed_at: Time.now)
      Order.create(amount: 600, merchant_id: merchant.id, shopper_id: shopper.id)
      Order.create(amount: 450, merchant_id: merchant.id, shopper_id: shopper.id, completed_at: Time.now)
    end

    it 'returns correct disbursements' do
      Calculations::DisbursementsCalculateLib.process(Merchant.first)
      total_expected = (100 * (1 - 0.0095)) + (450 * (1 - 0.0085))
      expect(Float(Disbursement.first.amount)).to eq(total_expected)
    end
  end
end
