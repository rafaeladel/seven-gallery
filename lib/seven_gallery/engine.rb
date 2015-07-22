require 'jquery-rails'
require 'jquery-ui-rails'
require 'bootstrap-sass'
require 'carrierwave'
require 'dropzonejs-rails'
require 'jcrop/rails/v2'
#require 'will_paginate'
#require 'factory_girl'

module SevenGallery
  class Engine < ::Rails::Engine
    isolate_namespace SevenGallery

    config.seven_gallery = ActiveSupport::OrderedOptions.new

    config.generators do |g|
      g.test_framework :rspec,
                       fixture: false,
                       view_specs: false,
                       routing_specs: false
      g.integration_tool :rspec
      g.performance_tool :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
