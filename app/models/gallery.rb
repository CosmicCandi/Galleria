class Gallery < ApplicationRecord
  has_many :photos
  belongs_to :user

  validates :title, presence: true
  validates_uniqueness_of :title, scope: :user_id
end
