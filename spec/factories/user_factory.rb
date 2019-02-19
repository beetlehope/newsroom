FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@sample.com" }
    password { 'password' }

    trait :editor do
      role { 'editor' }
    end
  end
end
