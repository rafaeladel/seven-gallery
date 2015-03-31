class ChangeSevenGalleryPhotos < ActiveRecord::Migration
  def change
    change_column_default :seven_gallery_photos, :position, 0
  end
end
