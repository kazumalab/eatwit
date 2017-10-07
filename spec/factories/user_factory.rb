FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "person#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    self_introduction "Hello!!"

    trait :with_password do
      password "abcdef1234"
      password_confirmation "abcdef1234"
    end
  end
end

