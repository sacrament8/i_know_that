require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "新規作成" do

    before do
      @user_a = create(:user_a)
      @user_b = create(:user_b)
      @room = create(:room, sender_id: @user_a.id, recipient_id: @user_b.id)
    end

    context "成功を期待" do

      it "user_id, room_id, contentがあれば有効" do
        message = build(:message, user_id: @user_a.id, room_id: @room.id)
        expect(message).to be_valid
      end

    end

    context "失敗を期待" do

      it "contentがなければ無効" do
        message = build(:message, user_id: @user_a.id, room_id: @room.id, content: "")
        expect(message).not_to be_valid
      end

      it "user_idがなければ無効" do
        message = build(:message, user_id: "", room_id: @room.id)
        expect(message).not_to be_valid
      end

      it "room_idがなければ無効" do
        message = build(:message, user_id: @user_a.id, room_id: "")
        expect(message).not_to be_valid
      end

    end

  end

  describe "メソッドテスト" do
    before do
      @user_a = create(:user_a)
      @user_b = create(:user_b)
      @room = create(:room, sender_id: @user_a.id, recipient_id: @user_b.id)

    end
    it "message_time" do
      message = build(:message, user_id: @user_a.id, room_id: @room.id, created_at: Time.new(2019, 12, 31, 8, 32))
      expect(message.message_time).to eq "2019/12/31 at  8:32 AM"
    end
  end
end
