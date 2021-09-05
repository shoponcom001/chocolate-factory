class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :order, foreign_key: true, null: false
      t.references :design, foreign_key: true, null: false
      t.string :buy_name, null: false
      t.boolean :material
      t.integer :size, null: false
      t.integer :buy_price, null: false
      t.datetime :due_date, null: false
      t.integer :production_status, null: false

      t.timestamps
    end
  end
end
