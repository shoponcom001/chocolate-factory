class Item < ApplicationRecord
  belongs_to :order
  belongs_to :design
  belongs_to :period_id

  enum material: { buy: true, not_buy: false }


end
