FactoryGirl.define do
  factory :gallery, class: SevenGallery::Gallery do

    factory :valid_gallery do
      title "a gallery"

      factory :gallery_with_photos do
        after(:build) do |gallery|
          create_list(:photo, 3, gallery: gallery)
        end
      end
    end

    factory :invalid_gallery do
      title ""
    end

  end
end