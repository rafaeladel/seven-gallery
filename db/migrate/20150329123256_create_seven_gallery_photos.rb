class CreateSevenGalleryPhotos < ActiveRecord::Migration
  def change
    create_table :seven_gallery_photos do |t|
      t.string :caption
      t.string :image
      t.references :gallery, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
