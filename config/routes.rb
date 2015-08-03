SevenGallery::Engine.routes.draw do
  resources :galleries do
    member do
      get "arrange_photos", to: "galleries#get_arrange"
      post "arrange_photos", to: "galleries#post_arrange"
    end
    resources :photos do
      member do
        get "featurize", to: "photos#featurize"
      end
      collection do
        get "photos_info"
        post "update_photos_info"
      end
    end
  end
end
