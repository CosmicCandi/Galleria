class Gallery < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates :title, presence: true
  validates_uniqueness_of :title, scope: :user_id

  default_scope { order(created_at: :desc) }

  def gallery_thumb
    if photos.any?
      photos.first.photo_upload.versions[:thumb]
    else
      "https://unsplash.it/100/100/?#{rand(1..1080)}"
    end
  end

end
