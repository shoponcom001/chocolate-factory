class Records < ActiveRecord::Migration[5.2]
  def change
    drop_table :due_date_periods
  end
end
