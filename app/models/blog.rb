class Blog < ApplicationRecord
  attachment :image

  has_many :blog_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_blogs, through: :likes, source: :user
  has_many :tags, dependent: :destroy


  validates :title, presence: true
  validates :body, presence: true

end
