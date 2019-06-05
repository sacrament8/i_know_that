FactoryBot.define do
  factory :message do
    content { "test content" }
    room_id { "" }
    user_id { "" }
    read { false }
  end
end
