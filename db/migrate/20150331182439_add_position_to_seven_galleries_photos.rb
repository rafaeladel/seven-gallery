class AddPositionToSevenGalleriesPhotos < ActiveRecord::Migration
  def change
    add_column :seven_gallery_photos, :position, :integer
  end
end
