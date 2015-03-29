class ChangePhotoInSevenGalleryPhotos < ActiveRecord::Migration
  def change
    rename_column :seven_gallery_photos, :photo, :photos
    change_column :seven_gallery_photos, :photos, :json
  end
end
