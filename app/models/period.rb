class Period < ApplicationRecord

  has_many :items


  validates :span, presence: true
  validates :day, numericality: { only_integer: true }

end
