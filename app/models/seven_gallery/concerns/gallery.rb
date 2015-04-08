module SevenGallery::Concerns::Gallery
	extend ActiveSupport::Concern

	included do
		has_many :photos, dependent: :destroy, class_name: "SevenGallery::Photo", foreign_key: :seven_gallery_gallery_id
    default_scope { order("created_at desc") }
	end
end