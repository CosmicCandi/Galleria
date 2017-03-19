class RenamePhotosPathToPhotosUpload < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :path, :string
    add_column :photos, :photo_upload, :string
  end
end
