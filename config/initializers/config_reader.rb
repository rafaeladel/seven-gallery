config_file = %W"#{Rails.root} config seven_gallery_config.yml".join(File::SEPARATOR)

if File.exist? config_file
  SevenGallery::ENGINE_CONFIG = YAML.load_file config_file
end

SevenGallery::ENGINE_CONFIG ||= {}