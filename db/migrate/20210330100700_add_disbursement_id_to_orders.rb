class AddDisbursementIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :disbursement, index: true
  end
end
