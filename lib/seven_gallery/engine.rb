require 'jquery-rails'
require 'jquery-ui-rails'
require 'bootstrap-sass'
require 'carrierwave'
require 'dropzonejs-rails'
require 'jcrop/rails/v2'
require 'will_paginate'

module SevenGallery
  class Engine < ::Rails::Engine
    isolate_namespace SevenGallery
  end
end
