class Item < ApplicationRecord
  belongs_to :order, optional: true
  # has_one :order
  belongs_to :design
  belongs_to :period

  enum material: { buy: true, not_buy: false }


end
