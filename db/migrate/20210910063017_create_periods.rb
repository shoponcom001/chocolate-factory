class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.integer :day
      t.string :span

      t.timestamps
    end
  end
end
