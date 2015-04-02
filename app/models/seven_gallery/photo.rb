module SevenGallery
  class Photo < ActiveRecord::Base
    belongs_to :gallery
    mount_uploader :image, SevenGallery::PhotoUploader
    attr_accessor :crop_x, :crop_y, :crop_h, :crop_w
    default_scope { order("position asc, created_at desc") }
    self.per_page = 5

    after_update :crop_image

    def crop_image
      image.recreate_versions! if crop_x.present?
    end
  end
end
