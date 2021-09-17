class Order < ApplicationRecord
  belongs_to :user
  has_one :item

  enum payment_method: { credit_card: 0, bank_transfer: 1 }

  # validates :postal_code, presence: true, format: { with: /\A\d{7}\z/, message: '「-」なしの半角数字で入力してください' }
  # validates :address, presence: true
  # validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください'}
  # validates :phone_number, format: { with: /\A\d{10,11}\z/}
  # validates :payment_method, presence: true

end
