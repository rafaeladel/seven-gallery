module SevenGallery
  class Photo < ActiveRecord::Base
    belongs_to :gallery
    mount_uploader :image, SevenGallery::PhotoUploader
  end
end
