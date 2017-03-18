class User < ApplicationRecord

  has_secure_password

  has_many :photos, through: :gallery
  has_many :galleries

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true

end
