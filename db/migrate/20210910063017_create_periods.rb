class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.integer :day, null: false
      t.string :span, null: false

      t.timestamps
    end
  end
end
