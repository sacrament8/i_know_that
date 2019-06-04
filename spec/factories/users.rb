FactoryBot.define do
  factory :user do
    name { "test_user" }
    email { "test@test.com" }
    password { "111111" }
  end
  factory :test_user, class: User do
    sequence(:name) { |n| "テストユーザー#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end