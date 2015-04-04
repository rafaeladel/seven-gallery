require_dependency "seven_gallery/application_controller"

module SevenGallery
  class PhotosController < ApplicationController
    include SevenGallery::Concerns::PhotosController
  end
end
