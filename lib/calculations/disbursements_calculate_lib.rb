module Calculations
  class DisbursementsCalculateLib
    def self.process(merchant)
      current_amount = 0
      disbursement = Disbursement.find_or_create_by(merchant_id: merchant.id, year: Time.current.year, week: Time.current.strftime('%U').to_i)
      Order.where(merchant_id: disbursement.merchant_id).where(disbursement_id: nil).completed.each do |order|
        current_amount = disbursement.amount.blank? ? current_amount : disbursement.amount  
        current_amount = current_amount + order.calculated_amount 
        disbursement.update(amount: current_amount)
        order.update(disbursement_id: disbursement.id)
      end
    end
  end
end 