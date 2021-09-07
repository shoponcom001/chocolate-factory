class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :orders
  
  validates :name, presence: true
  validates :email, presence: true
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  
end
