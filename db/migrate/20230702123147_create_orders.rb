class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :method_of_payment, default: 0, null: false
      t.integer :status, default: 0, null: false
      t.integer :postage, null: false
      t.integer :total_amount_billed, null: false
      t.timestamps null: false
    end
  end
end
