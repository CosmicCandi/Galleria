class Photo < ApplicationRecord
  belongs_to :gallery, counter_cache: true

  default_scope { order(created_at: :desc) }

  mount_uploader :photo_upload, PhotoUploader

end
