require 'rails_helper'

RSpec.describe Api::V1::DisbursementsController, type: :controller do
  describe 'GET #index' do
    before do
      merchant_1 = Merchant.create(name: "Merchant test", cif: "E42340869", email: "merchant_test@gmail.com")
      merchant_2 = Merchant.create(name: "Merchant test2", cif: "E42340879", email: "merchant_test2@gmail.com")

      Disbursement.create(amount: 200.20, merchant_id: merchant_1.id, year: Time.current.year, week: Time.current.strftime('%U').to_i)
      Disbursement.create(amount: 300.20, merchant_id: merchant_2.id, year: Time.current.year, week: Time.current.strftime('%U').to_i)
    end

    it 'returns all disbursements' do
      get :index
      json = JSON.parse(response.body)
      expect(json.count).to eq(2)
    end

    it 'returns disbursement of first merchant' do
      merchant = Merchant.first

      get :index, params: { merchant_id: merchant.id }
      json = JSON.parse(response.body)
      expect(json.count).to eq(1)
    end

    it 'returns disbursements with year params' do
      get :index, params: { year: Time.current.year}
      json = JSON.parse(response.body)
      expect(json.count).to eq(2)
    end
  end
end