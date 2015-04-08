class AddForeignKeyToGalleries < ActiveRecord::Migration
  def change
    add_foreign_key :seven_gallery_photos, :seven_gallery_galleries, on_delete: :cascade
  end
end
