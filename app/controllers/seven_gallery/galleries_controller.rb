require_dependency "seven_gallery/application_controller"

module SevenGallery
  class GalleriesController < ApplicationController
    include SevenGallery::Concerns::GalleriesController
  end
end
