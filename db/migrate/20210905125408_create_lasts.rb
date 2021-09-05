class CreateLasts < ActiveRecord::Migration[5.2]
  def change
    create_table :lasts do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
