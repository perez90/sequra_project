class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :amount
      t.datetime :completed_at

      t.references :shopper, index: true
      t.references :merchant, index: true
      t.timestamps
    end
  end
end
