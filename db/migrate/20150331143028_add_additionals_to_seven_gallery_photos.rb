class AddAdditionalsToSevenGalleryPhotos < ActiveRecord::Migration
  def change
    add_column :seven_gallery_photos, :is_featured, :boolean, default: false
    add_column :seven_gallery_photos, :description, :text
    add_column :seven_gallery_photos, :alt, :string
  end
end
