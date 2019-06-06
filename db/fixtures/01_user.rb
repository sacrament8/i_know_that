require 'faker'

# テストユーザーログインで使用するユーザー
User.create!(
  name: "test-user",
  email: "test@test.com",
  password: '111111',
  password_confirmation: '111111',
  avatar: File.open("#{Rails.root}/db/fixtures/image/avatar.jpg")
  )

# その他のユーザー
14.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: "tester#{n + 1}@example.com",
    password: "password",
    password_confirmation: "password"
    )
end