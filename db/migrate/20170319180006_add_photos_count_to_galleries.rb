class AddPhotosCountToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :photos_count, :integer, default: 0
  end
end
