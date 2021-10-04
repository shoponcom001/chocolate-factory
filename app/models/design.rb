class Design < ApplicationRecord
  has_many :items
  attachment :image

  validates :image, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :is_ordered, presence: true

  enum is_ordered: {
    on_sale: false,
    stop_sale: true
  }


end
