module SevenGallery::Concerns::PhotosController
  extend ActiveSupport::Concern

  included do
    before_action :get_gallery
    before_action :get_photo, only: [:show, :edit, :update, :destroy, :featurize]
    before_action :get_new_photo, only: [:new, :create]
  end

  def index
    @photos = SevenGallery::Photo.all
  end

  def show
  end

  def new
  end

  def create
    @photo = @gallery.photos.new(photo_params)
    @photo.position = @gallery.photos.length
    if @photo.save
      session["end_url"] ||= request.referer
      render json: {:success => true, :return_url => photos_info_gallery_photos_path(@gallery)}
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
    @photos = SevenGallery::Photo.where(is_new: true)
  end

  def update_photos_info
    @photos = SevenGallery::Photo.update(params[:photos].keys, params[:photos].values)
    @valid_photos = @photos.reject { |photo| !photo.valid? }
    @photos.reject! { |photo| photo.valid? }
    if @photos.empty?
      @valid_photos.map { |photo| photo.toggle!(:is_new) }
      redirect_to session.delete(:end_url) || @gallery
    else
      render :photos_info
    end
  end

  def featurize
    @gallery.photos.update_all({is_featured: false})
    @photo.toggle(:is_featured)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to :back, notice: 'Photo was successfully updated.' }
        format.json { render json: {success: true} }
      end
    end
  end

  def destroy
    @photo.destroy
    redirect_to @gallery, notice: 'Photo was successfully destroyed.'
  end

  private
  def get_gallery
    @gallery = SevenGallery::Gallery.find(params[:gallery_id])
  end

  def get_photo
    @photo = @gallery.photos.find(params[:id])
    # @photo = SevenGallery::Photo.find_by(gallery_id: params[:gallery_id], id: params[:id])
  end

  def get_new_photo
    @photo = SevenGallery::Photo.new
  end

  def photo_params
    params.require(:photo).permit(:caption, :image, :description, :is_featured, :alt, :crop_x, :crop_y, :crop_w, :crop_h)
  end
end
