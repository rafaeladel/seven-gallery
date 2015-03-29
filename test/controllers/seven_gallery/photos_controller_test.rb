require 'test_helper'

module SevenGallery
  class PhotosControllerTest < ActionController::TestCase
    def setup
      @gallery = galleries(:one)
      @photo = photos(:one)
    end

    test "add new photo" do
      get :new, gallery_id: @gallery.id
      assert_template "photos/new"
    end
  end
end
