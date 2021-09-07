class CreateDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :image_id, null: false
      t.boolean :is_ordered, null: false

      t.timestamps
    end
  end
end
