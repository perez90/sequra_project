require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    subject { described_class.new(name: 'Merchant test', cif: 'E42340869', email: 'merchant_test@gmail.com') }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cif) }
    it { should validate_presence_of(:email) }

    describe 'email validate' do
      it 'email valid' do
        expect(subject).to be_valid
      end

      it 'email invalid' do
        subject.email = 'merchant_test-gmail.com'
        expect(subject).not_to be_valid
      end
    end
  end
  describe 'associations' do
    it { should have_many(:orders) }
  end
end
