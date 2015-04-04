module SevenGallery::Concerns::Gallery
	extend ActiveSupport::Concern

	included do
		has_many :photos, dependent: :destroy
    	default_scope { order("created_at desc") }
	end
end