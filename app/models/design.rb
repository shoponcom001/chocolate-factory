class Design < ApplicationRecord
  has_many :items
  attachment :image

  enum is_deleted: { on_sale: false, stop_sale: true}
end
