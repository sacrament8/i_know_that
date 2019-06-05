FactoryBot.define do
  factory :room do
    sender_id { create(:user_a) }
    recipient_id { create(:user_b) }
  end
end
