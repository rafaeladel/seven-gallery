module SevenGallery
  class Photo < ActiveRecord::Base
    belongs_to :gallery, dependent: :destroy

    mount_uploader :image, SevenGallery::PhotoUploader
  end
end
