class Item < ApplicationRecord
  belongs_to :order
  belongs_to :design

  enum due_date: { buy: true, not_buy: false }

end
