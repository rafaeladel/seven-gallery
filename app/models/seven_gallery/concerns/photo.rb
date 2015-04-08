module SevenGallery::Concerns::Photo
	extend ActiveSupport::Concern

	included do
    belongs_to :gallery, class_name: "SevenGallery::Gallery"
    mount_uploader :image, SevenGallery::PhotoUploader
    attr_accessor :crop_x, :crop_y, :crop_h, :crop_w
    default_scope { order("position asc, created_at desc") }
    self.per_page = 5
    after_update :crop_image
  end

  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end