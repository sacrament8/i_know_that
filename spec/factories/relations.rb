FactoryBot.define do
  factory :relation do
    follower_id { create(:user_a).id }
    followed_id { create(:user_b).id }
  end
end