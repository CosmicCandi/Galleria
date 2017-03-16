class User < ApplicationRecord
  has_many :photos, through: :gallery
  has_many :galleries

  
end
