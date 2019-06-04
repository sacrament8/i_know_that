require 'rails_helper'
RSpec.describe Post, type: :model do
  
  describe "Postのモデルテスト" do
    
    describe "Postの新規作成" do

      context "成功を期待する" do
        it "title, description, image, user_idが存在すれば有効" do
          post = build(:post)
          expect(post).to be_valid
        end
      end

      context "失敗を期待する" do

        it "descriptionが空だと無効" do
          post = build(:post, description: "")
          post.valid?
          expect(post.errors.messages[:description]).to include("は1文字以上で入力してください")
        end

        it "descriptionが501文字以上だと無効" do
          post = build(:post, description: "a" * 501)
          post.valid?
          expect(post.errors.messages[:description]).to include("は500文字以内で入力してください")
        end

        it "titleが空だと無効" do
          post = build(:post, title: "")
          post.valid?
          expect(post.errors.messages[:title]).to include("は1文字以上で入力してください")
        end

        it "titleが21文字以上だと無効" do
          post = build(:post, title: "a" * 21)
          post.valid?
          expect(post.errors.messages[:title]).to include("は20文字以内で入力してください")
        end

        it "imageが空だと無効" do
          post = build(:post, image: "")
          post.valid?
          expect(post.errors.messages[:image]).to include("を入力してください")
        end

        it "statusが空だと無効" do
          post = build(:post, status: "")
          post.valid?
          expect(post.errors.messages[:status]).to include("を入力してください")
        end

        it "imageのmime typeがimage/jpegかimage/png以外であれば無効" do
          post = build(:post, image: fixture_file_upload("#{Rails.root}/spec/fixtures/image/flower.jpg.zip"))
          post.valid?
          expect(post.errors.messages[:image]).to include("はjpegまたはpng形式の物のみ投稿できます")
        end

      end
    end

    describe "postモデルのメソッドテスト" do

      it "prepare_created_atメソッドのテスト" do
        post = build(:post, created_at: Time.new(2019, 12, 31))
        expect(post.prepare_created_at).to eq "2019年12月31日"
      end

    end
  end
end
