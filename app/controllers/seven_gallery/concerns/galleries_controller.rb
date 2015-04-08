module SevenGallery::Concerns::GalleriesController
  extend ActiveSupport::Concern

  included do
    before_action :get_gallery, only: [:show, :edit, :update, :destroy, :get_arrange, :post_arrange]
  end

  # GET /galleries
    def index
      @galleries = SevenGallery::Gallery.paginate(page: params[:page], per_page: 10)
    end

  # GET /galleries/1
    def show
      @photos = @gallery.photos.paginate(page: params[:page])
    end

  # GET /galleries/new
    def new
      @gallery = SevenGallery::Gallery.new
    end

  # GET /galleries/1/edit
    def edit
    end

  # POST /galleries
    def create
      @gallery = SevenGallery::Gallery.new(gallery_params)

      if @gallery.save
        redirect_to @gallery, notice: 'Gallery was successfully created.'
      else
        render :new
      end
    end

  # PATCH/PUT /galleries/1
    def update
      if @gallery.update(gallery_params)
        redirect_to @gallery, notice: 'Gallery was successfully updated.'
      else
        render :edit
      end
    end

    def get_arrange
    end

    def post_arrange
      # turning [12,13,15,14,16] into {"12"=>0, "13"=>1, "15"=>2, "14"=>3, "16"=>4}
      temp_hash = Hash[params[:photo].zip (0..params[:photo].size-1)]

      # turning {"12"=>0, "13"=>1, .. } into {"12"=>{:position=>0}, "13"=>{:position=>1}, ...}
      temp_hash.update(temp_hash) { |k, v| v = { position: v } }

      $photos = SevenGallery::Photo.update(temp_hash.keys, temp_hash.values)
      render json: { success: $photos.any? ? true : false }
    end

  # DELETE /galleries/1
    def destroy
      @gallery.destroy
      redirect_to galleries_url, notice: 'Gallery was successfully destroyed.'
    end

    private
  # Use callbacks to share common setup or constraints between actions.
    def get_gallery
      @gallery = SevenGallery::Gallery.find(params[:id])
    end

  # Only allow a trusted parameter "white list" through.
    def gallery_params
      params.require(:gallery).permit(:title)
    end
end