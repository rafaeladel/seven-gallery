SevenGallery::Engine.routes.draw do
  resources :galleries do
    resources :photos
  end
end
