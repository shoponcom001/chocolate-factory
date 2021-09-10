class Item < ApplicationRecord
  belongs_to :order
  belongs_to :design

  enum material: { buy: true, not_buy: false }


end
