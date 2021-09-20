class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :order_id, null: false
      t.references :design, foreign_key: true, null: false
      t.integer :period_id, null: false
      t.string :buy_name, null: false
      t.boolean :material
      t.integer :size, null: false
      t.integer :buy_price, null: false
      t.integer :production_status, null: false, default: 0

      t.timestamps
    end
  end
end
