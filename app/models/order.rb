class Order < ApplicationRecord
  belongs_to :user
  has_one :item
  # belongs_to :item
  
  enum payment_method: { credit_card: 0, bank_transfer: 1 }
  
end
