SevenGallery::Engine.routes.draw do
  resources :galleries do
    resources :photos do
      collection do
        get "photos_info"
        post "update_photos_info"
      end
    end
  end
end
