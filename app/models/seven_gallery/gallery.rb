module SevenGallery
  class Gallery < ActiveRecord::Base
    has_many :photos, dependent: :destroy
    default_scope { order("created_at desc") }
  end
end
