FactoryBot.define do
  factory :user do
    name { "test_user" }
    email { "test@test.com" }
    password { "111111" }
  end
  
  factory :user_a, class: User do
    name { "foo_user" }
    email { "foo@test.com" }
    password { "111111" }
  end

  factory :user_b, class: User do
    name { "bar_user" }
    email { "bar@test.com" }
    password { "111111" }
  end

  factory :test_user, class: User do
    sequence(:name) { |n| "テストユーザー#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end