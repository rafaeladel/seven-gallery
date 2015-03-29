require_dependency "seven_gallery/application_controller"

module SevenGallery
  class PhotosController < ApplicationController
    before_action :get_gallery
    before_action :get_photo, only: [:show, :edit, :update, :destroy]
    before_action :get_new_photo, only: [:new, :create]
    
    def index
      @photos = Photo.all
    end

    def show
    end

    def new
    end

    def create
      @photo = @gallery.photos.create(photo_params)
      @photo.photos = params[:photo][:photos]
      if @photo.save
        redirect_to @gallery
      else
        render 'new'
      end
    end
    
    def edit
    end
    
    def update
      if @photo.update(photo_params)
        redirect_to @gallery, notice: 'Photo was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @gallery.destroy
      redirect_to galleries_url, notice: 'Photo was successfully destroyed.'
    end

    private
      def get_gallery
        @gallery = Gallery.find(params[:gallery_id])
      end

      def get_photo
        @photo = Photo.find_by(gallery_id: params[:gallery_id], id: params[:id])
      end

      def get_new_photo
        @photo = Photo.new
      end

      def photo_params
        params.require(:photo).permit(:caption, :photos)
      end

  end
end
