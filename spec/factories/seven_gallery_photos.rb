FactoryGirl.define do
  factory :photo, class: SevenGallery::Photo do
    association :gallery, factory: :valid_gallery
    factory :valid_photo do

    end
  end
end