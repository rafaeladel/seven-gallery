class AddPhotoToSevenGalleryPhotos < ActiveRecord::Migration
  def change
    add_column :seven_gallery_photos, :photo, :string
  end
end
