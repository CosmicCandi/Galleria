class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.references :photo, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.integer :photo_count

      t.timestamps
    end
  end
end
