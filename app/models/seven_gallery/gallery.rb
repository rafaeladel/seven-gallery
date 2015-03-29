module SevenGallery
  class Gallery < ActiveRecord::Base
    has_many :photos
  end
end
