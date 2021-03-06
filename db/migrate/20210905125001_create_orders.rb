class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :phone_number, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :order_status, null: false, default: 0
      t.integer :price, null: false
      t.datetime :due_date, null: false

      t.timestamps
    end
  end
end
