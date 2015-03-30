module SevenGallery
  class Gallery < ActiveRecord::Base
    has_many :photos, dependent: :destroy
  end
end
