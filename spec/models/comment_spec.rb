require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "新規作成" do
    before do
      @post = create(:post)
      @user = create(:test_user)
    end
    context "成功を期待" do
      it "contentとpost_idとuser_idがあれば有効" do
        comment = build(:comment, post_id: @post.id, user_id: @user.id)
        expect(comment).to be_valid
      end

      it "user_idは無くても有効" do
        comment = build(:comment, post_id: @post.id, user_id: "")
        expect(comment).to be_valid
      end
    end

    context "失敗を期待" do

      it "post_idが空なら無効" do
        comment = build(:comment, post_id: "", user_id: @user.id)
        expect(comment).not_to be_valid
      end

      it "contentが空なら無効" do
        comment = build(:comment, post_id: @post.id, user_id: @user.id, content: "")
        expect(comment).not_to be_valid
      end
    end
  end
end
