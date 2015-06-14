# SevenGallery
A Rails gallery engine 

## Installation

1. mount the engine in your application config/routes.rb file

```ruby 
mount SevenGallery::Engine, at: "/seven_gallery" 
```

2. Install engine migrations

```ruby 
rake seven_gallery:install:migrations 
```

3. connect SevenGallery::Gallery to your application model

First, create the relationship between your model and gallery

> app/models/my_model.rb

```ruby
module MyApp
  class MyModel < ActiveRecord::Base
    has_one :gallery, class_name: 'SevenGallery::Gallery', foreign_key: "my_model_id"
  end
end
```

Second, override the Gallery model, by creating seven_gallery inside models folder and place gallery.rb inside it.

> app/models/seven_gallery/gallery.rb

```ruby
module SevenGallery
  class Gallery < ActiveRecord::Base
    include SevenGallery::Concerns::Gallery
    belongs_to :my_model, class_name: "::MyModel", foreign_key: "my_model_id"
  end
end
```
Third, establish migrations

rails generate migration add_gallery_to_my_model

> XXXXXXXXXXXXX_add_gallery_to_my_model.rb

```ruby
class AddGalleryToMyModel < ActiveRecord::Migration
  def change
    add_reference :seven_gallery_galleries, :my_model, index: true, foreign_key: true, on_delete: :cascade
  end
end
```

That's it, you can access your model gallery like this: `@my_model.gallery`

If you want a direct access from your model to your photos you can add this line inside `app/models/my_model.rb`

```ruby
has_many :photos, class: 'SevenGallery::Photo', through: :gallery
```

You can also override the views by copying files inside `seven_gallery` engine in `<SevenGallery Root>/app/views/seven_gallery/*` to your application `app/views/seven_gallery/*`
