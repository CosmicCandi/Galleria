class User < ApplicationRecord

  has_secure_password

  has_many :galleries
  has_many :photos, through: :galleries

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

end
