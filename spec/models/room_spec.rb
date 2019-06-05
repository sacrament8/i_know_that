require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "新規作成" do

    before do
      @user_a = create(:user_a)
      @user_b = create(:user_b)
    end
    context "成功を期待" do
      it "sender_idとrecipient_idがあれば有効" do
        room = create(:room, sender_id: @user_a.id, recipient_id: @user_b.id)
        expect(room).to be_valid
      end
    end

    context "失敗を期待" do
      it "sender_idとrecipient_idが同じ組み合わせは無効" do
        create(:room, sender_id: @user_a.id, recipient_id: @user_b.id)
        room = build(:room, sender_id: @user_a.id, recipient_id: @user_b.id)
        expect(room).not_to be_valid
      end
    end
  end

  describe "メソッドテスト" do

    before do
      @user_a = create(:user_a)
      @user_b = create(:user_b)
    end

    it "target_user(current_user)" do
      room = create(:room, sender_id: @user_a.id, recipient_id: @user_b.id)
      expect(room.target_user(@user_a)).to eq @user_b
    end
  end

  describe "scopeテスト" do

    before do
      @user_a = create(:user_a)
      @user_b = create(:user_b)
    end

    it "between" do
      create(:room, sender_id: @user_a.id, recipient_id: @user_b.id)
      room_a = Room.between(@user_a, @user_b).first
      room_b = Room.between(@user_b, @user_a).first
      expect(room_a).to eq room_b
    end
  end
end
