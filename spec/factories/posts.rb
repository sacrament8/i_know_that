FactoryBot.define do
  factory :post do
    title { "テストタイトル" }
    description { "テストコンテント" }
    status { "未解決" }
    user
    image { fixture_file_upload("#{Rails.root}/spec/fixtures/image/test.png", 'image/png') }
  end
  factory :test_post, class: Post do
    sequence(:title) { |n| "タイトル#{n}" }
    sequence(:description) { |n| "コンテント#{n}" }
    status { "未解決" }
    user
    image { fixture_file_upload("#{Rails.root}/spec/fixtures/image/test.png", 'image/png') }
  end
end


