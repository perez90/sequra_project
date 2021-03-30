require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  describe 'validations' do

    describe 'associations' do
      it { should belong_to(:merchant) }
      it { should have_many(:orders) }
    end

    describe "validations" do
      it { should validate_presence_of(:amount) }
    end
  end
end
