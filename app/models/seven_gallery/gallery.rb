module SevenGallery
  class Gallery < ActiveRecord::Base
    include SevenGallery::Concerns::Gallery
  end
end
