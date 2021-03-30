class CreateDisbursements < ActiveRecord::Migration[5.2]
  def change
    create_table :disbursements do |t|
      t.float :amount
      t.integer :week
      t.integer :year
      t.references :merchant, index: true
      t.timestamps
    end
  end
end
