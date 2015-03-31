require_dependency "seven_gallery/application_controller"

module SevenGallery
  class GalleriesController < ApplicationController
    before_action :get_gallery, only: [:show, :edit, :update, :destroy, :get_arrange, :post_arrange]

    # GET /galleries
    def index
      @galleries = Gallery.paginate(page: params[:page], per_page: 10)
    end

    # GET /galleries/1
    def show
      @photos = Photo.where(gallery_id: @gallery).paginate(page: params[:page], per_page: 5)
    end

    # GET /galleries/new
    def new
      @gallery = Gallery.new
    end

    # GET /galleries/1/edit
    def edit
    end

    # POST /galleries
    def create
      @gallery = Gallery.new(gallery_params)

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
      puts Hash[params[:photo].zip ["position"]*params[:photo]. (0..params[:photo].size - 1)]
      params
      render json: { result: params[:photo] }
    end

    # DELETE /galleries/1
    def destroy
      @gallery.destroy
      redirect_to galleries_url, notice: 'Gallery was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def get_gallery
        @gallery = Gallery.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def gallery_params
        params.require(:gallery).permit(:title)
      end
  end
end
