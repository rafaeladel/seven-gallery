module SevenGallery
  class Photo < ActiveRecord::Base
    belongs_to :gallery, dependent: :destroy

    mount_uploader :photos, SevenGallery::PhotoUploader
  end
end
