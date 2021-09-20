class Blog < ApplicationRecord
  has_many :likes
  has_many :blog

  attachment :image

  validates :title, presence: true
  validates :body, presence: true

end
