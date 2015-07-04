$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "seven_gallery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "seven_gallery"
  s.version     = SevenGallery::VERSION
  s.authors     = ["rafael"]
  s.email       = ["rafael.adel20@gmail.com"]
  s.homepage    = "https://github.com/rafaeladel/seven-gallery"
  s.summary     = "A Rails gallery engine."
  s.description = <<-EOF
   "A Rails gallery engine.
    Includes creating multiple galleries and photos. 
    Multi uploading and cropping. 
    Can extend gallery and photo model or controller. 
    Configurable through yml configuration file."
   EOF
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  # s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "sass-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "carrierwave"
  s.add_dependency "mini_magick"
  s.add_dependency "dropzonejs-rails"
  s.add_dependency 'uglifier'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'jcrop-rails-v2'
  s.add_dependency "will_paginate"
  s.add_dependency "mysql2"

  s.add_development_dependency "pg"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
end
