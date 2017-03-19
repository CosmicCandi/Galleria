class RemovePhotoIdFromGalleries < ActiveRecord::Migration[5.0]
  def change
    remove_column :galleries, :photo_id, :integer
  end
end
