namespace :calculate_disbursements do
  desc "TODO"
  task all_merchant: :environment do
    p 'Creating current disbursements'
    Merchant.find_each do |merchant|
      Calculations::DisbursementsCalculateLib.process(merchant)
    end
    p 'Finished current disbursements'
  end
end
