require 'rails_helper'

RSpec.describe User, type: :model do

  describe "ユーザーのモデルテスト" do
    
    describe "ユーザーの新規作成" do

      context "成功を期待する" do
        it "avatarは空でもname, email, passwordが存在すれば有効" do
          user = build(:user, avatar: "")
          expect(user).to be_valid
        end
      end

      context "失敗を期待する" do

        it "nameが1文字以下だと無効" do
          user = build(:user, name: "a")
          user.valid?
          expect(user.errors.messages[:name]).to include("は2文字以上で入力してください")
        end

        it "nameが26文字以上だと無効" do
          user = build(:user, name: "a"*26)
          user.valid?
          expect(user.errors.messages[:name]).to include("は25文字以内で入力してください")
        end

        it "emailが空だと無効" do
          user = build(:user, email: "")
          user.valid?
          expect(user.errors.messages[:email]).to include("を入力してください")
        end

      end
    end

    describe "ユーザーモデルのメソッドテスト" do

      before(:example) do
        @user1 = create(:test_user)
        @user2 = create(:test_user)
      end

      context "フォロー機能に関係するメソッド" do

        it "follow!(other_user)メソッドのテスト" do
          @user1.follow!(@user2)
          relation = Relation.first
          expect(relation.follower_id).to eq @user1.id
          expect(relation.followed_id).to eq @user2.id
        end

        it "following?(other_user)メソッドのテスト" do
          @user1.follow!(@user2)
          expect(@user1.following?(@user2).followed_id).to eq @user2.id
        end

        it "followed?(other_user)メソッドのテスト" do
          @user1.follow!(@user2)
          expect(@user2.followed?(@user1).followed_id).to eq @user2.id
        end

        it "unfollow!(other_user)メソッドのテスト" do
          @user1.follow!(@user2)
          relation = Relation.first
          expect(relation.follower_id).to eq @user1.id
          expect(relation.followed_id).to eq @user2.id
          @user1.unfollow!(@user2)
          relation = Relation.first
          expect(relation).to eq nil
        end

        it "reverse_unfollow!(other_user)メソッドのテスト" do
          @user1.follow!(@user2)
          relation = Relation.first
          expect(relation.follower_id).to eq @user1.id
          expect(relation.followed_id).to eq @user2.id
          @user2.reverse_unfollow!(@user1)
          relation = Relation.first
          expect(relation).to eq nil
        end
      end
    end
  end
end