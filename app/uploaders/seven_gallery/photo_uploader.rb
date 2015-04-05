# encoding: utf-8
module SevenGallery
  class PhotoUploader < CarrierWave::Uploader::Base

    # Include RMagick or MiniMagick support:
    # include CarrierWave::RMagick
    # include CarrierWave::MiniMagick
    include CarrierWave::MiniMagick
    # Choose what kind of storage to use for this uploader:
    storage :file
    # storage :fog

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # Provide a default URL as a default if there hasn't been a file uploaded:
    # def default_url
    #   # For Rails 3.1+ asset pipeline compatibility:
    #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    #
    #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    # end

    # Process files as they are uploaded:
    # process :resize_to_limit => [800, 600]
    #
    # def scale(width, height)
    #   # do something
    # end

    version :large do
      process :resize_to_limit => [700, 500]
    end

    # Create different versions of your uploaded files:
    if SevenGallery::ENGINE_CONFIG.key?("filters")
      SevenGallery::ENGINE_CONFIG["filters"].each do |key, value|
        version key do
          process :resize_to_limit => [value["width"], value["height"]]
        end
      end
    end

    version :thumb do
      process :process_crop
      process :resize_to_fit => [100, 100]
    end

    def process_crop
      puts "test"
      if model.crop_x.present?
        resize_to_limit(700, 500)
        manipulate! do |img|
          x = model.crop_x.to_i
          y = model.crop_y.to_i
          w = model.crop_w.to_i
          h = model.crop_h.to_i
          img.crop "#{w}x#{h}+#{x}+#{y}"
	  img
        end
      end
    end

    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_white_list
      %w(jpg jpeg gif png)
    end

    # Override the filename of the uploaded files:
    # Avoid using model.id or version_name here, see uploader/store.rb for details.
    # def filename
    #   "something.jpg" if original_filename
    # end

  end
end
