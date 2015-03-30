class AddIsNewToSevenGalleryPhotos < ActiveRecord::Migration
  def change
    add_column :seven_gallery_photos, :is_new, :boolean, default: true
  end
end
