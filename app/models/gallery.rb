class Gallery < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates :title, presence: true
  validates_uniqueness_of :title, scope: :user_id
end
