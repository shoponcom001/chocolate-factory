class Item < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :design
  belongs_to :period

  enum material: {
    buy: true,
    not_buy: false
  }

  enum production_status: {
    waiting_for_production: 0,
    during_production: 1,
    production_completed: 2
  }
  validates :size, presence: true
  validates :material, presence: true


end
