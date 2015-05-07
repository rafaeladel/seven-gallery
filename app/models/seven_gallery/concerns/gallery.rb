module SevenGallery::Concerns::Gallery
	extend ActiveSupport::Concern

	included do
    validates :title, presence: true
		has_many :photos, class_name: "SevenGallery::Photo", foreign_key: "seven_gallery_gallery_id", dependent: :destroy
    default_scope { order("created_at desc") }
	end
end