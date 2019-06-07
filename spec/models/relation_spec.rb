require 'rails_helper'

RSpec.describe Relation, type: :model do
  describe "新規作成テスト" do

    context "成功を期待" do
      it "重複しない組み合わせは有効" do
        user_a = create(:user_a)
        user_b = create(:user_b)
        relation = build(:relation, follower_id: user_a.id, followed_id: user_b.id)
        expect(relation).to be_valid
      end
    end

    context "失敗を期待" do

      it "既に存在する組み合わせだと無効" do
        user_a = create(:user_a)
        user_b = create(:user_b)
        create(:relation, follower_id: user_a.id, followed_id: user_b.id)
        relation = build(:relation, follower_id: user_a.id, followed_id: user_b.id)
        expect(relation).not_to be_valid
      end
    end

  end
end
