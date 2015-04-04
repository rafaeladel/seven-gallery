module SevenGallery
  class Photo < ActiveRecord::Base
    include SevenGallery::Concerns::Photo
  end
end
