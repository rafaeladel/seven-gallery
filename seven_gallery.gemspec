$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "seven_gallery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "seven_gallery"
  s.version     = SevenGallery::VERSION
  s.authors     = ["rafael"]
  s.email       = ["rafael.adel20@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SevenGallery."
  s.description = "TODO: Description of SevenGallery."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "sass-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "carrierwave"
  s.add_dependency "mini_magick"
  s.add_dependency "dropzonejs-rails"
  s.add_dependency 'sass-rails'
  s.add_dependency 'uglifier'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'jcrop-rails-v2'
  s.add_dependency "will_paginate"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'minitest-reporters'
  s.add_development_dependency 'mini_backtrace'
end
