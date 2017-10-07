FactoryGirl.define do
  factory :social_account do
    provider "Twitter"
    sequence(:uid) { |n| "12345#{n}" }
    sequence(:name) { |n| "person_nickname#{n}" }

    trait :with_profile_image do
      profile_image "example.png"
    end
  end
end

