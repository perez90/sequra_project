p "filling tables"
File.open('./db/seeds/merchants.csv').each_line do |row|
  merchant = row.strip.split(',')
  Merchant.create(id: merchant[0], name: merchant[1], email: merchant[2], cif: merchant[3])
end
File.foreach('./db/seeds/shoppers.csv') do |row|
  shopper = row.strip.split(',')
  Shopper.create(id: shopper[0], name: shopper[1], email: shopper[2], nif: shopper[3])
end
File.foreach('./db/seeds/orders.csv') do |row|
  order = row.strip.split(',')
  Order.create(id: order[0], merchant_id: order[1], shopper_id: order[2], amount: order[3], created_at: order[4], completed_at: order[5])
end
p "finished, filled tables"