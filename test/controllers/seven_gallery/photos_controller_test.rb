require 'test_helper'
require 'pp'

module SevenGallery
  class PhotosControllerTest < ActionController::TestCase
    def setup
      @gallery = seven_gallery_galleries(:gallery_one)
      @photo = seven_gallery_photos(:photo_one)
      @routes = SevenGallery::Engine.routes
    end

    test "show photo" do
      get :show, gallery_id: @gallery, id: @photo
      assert_response 200
      assert_template "photos/show"
    end

    test "test upload photo" do
      caption = "new caption"
      photo_file = fixture_file_upload("files/fat-cat.jpg", "image/jpg")
      assert_difference "Photo.count", 1 do
        post :create, gallery_id: @gallery, photo: { caption: caption, gallery_id: @gallery, image: photo_file.original_filename }
      end
      assert_redirected_to photos_info_gallery_photos_url, gallery_id: @gallery
    end

    test "test photos info page" do
      get :photos_info, gallery_id: @gallery
      assert_select "div.photo_form", count: 2
    end


    test "delete photo successfully" do
      assert_difference "Photo.count", -1 do
        delete :destroy, gallery_id: @gallery, id: @photo
      end
    end
  end
end
