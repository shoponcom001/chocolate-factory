class RemoveOrderIdNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:items, :order_id, true)
  end
end
