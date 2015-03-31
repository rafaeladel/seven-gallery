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
      if @photo.save
        render json: { :success => true, :return_url => photos_info_gallery_photos_path(@gallery) }
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

    def photos_info
      @photos = Photo.where(is_new: true)
    end

    def update_photos_info
      @photos = Photo.update(params[:photos].keys, params[:photos].values)
      @photos.reject! { |photo| photo.valid? }
      if @photos.empty?
        redirect_to @gallery
      else
        render :photos_info
      end
    end

    def destroy
      @photo.destroy
      redirect_to @gallery, notice: 'Photo was successfully destroyed.'
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
        params.require(:photo).permit(:caption, :image, :description, :is_featured, :alt, :crop_x, :crop_y, :crop_w, :crop_h)
      end

  end
end
