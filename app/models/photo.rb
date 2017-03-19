class Photo < ApplicationRecord
  belongs_to :gallery, counter_cache: true

  mount_uploader :photo_upload, PhotoUploader

end
