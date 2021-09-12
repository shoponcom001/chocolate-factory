class Item < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :design
  belongs_to :period_id

  enum material: { buy: true, not_buy: false }


end
