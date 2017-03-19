class AddGalleriesIdToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :gallery_id, :integer
  end
end
