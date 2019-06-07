require "rails_helper"

describe "ダイレクトメッセージ関連", type: :system do
  before do
    @other_user = create(:user_a)
    @post = create(:post, user_id: @other_user.id)
    @user = create(:user)
    visit new_user_session_path
    click_on "テストユーザーでログイン"
  end
  describe "共有フォロー機能" do
    context "フォロー追加" do

      it "他ユーザーの投稿のひそひそボタンからフォローに追加" do
        visit post_path(@post)
        click_on "ひそひそ"
        sleep 2
        expect(page).to have_content "#{@other_user.name}さんとひそひそ状態になりました"
      end

      it "ひそひそ一覧画面のひそひそ中ボタンからフォロー解除できる" do
        visit post_path(@post)
        click_on "ひそひそ"
        visit user_path(@user)
        click_on "ひそひそ一覧"
        sleep 4
        click_on "ひそひそ中"
        page.accept_confirm
        expect(page).to have_content "#{@other_user.name}さんとのひそひそ状態を解除しました"
      end

    end

    context "フォロー一覧" do

      before do
        @other_user2 = create(:user_b)
        @post2 = create(:post, user_id: @other_user2.id)
      end

      it "フォロー中のユーザー2人がひそひそ一覧に表示される" do
        visit post_path(@post)
        sleep 1
        click_on "ひそひそ"
        visit post_path(@post2)
        sleep 1
        click_on "ひそひそ"
        visit user_path(@user)
        sleep 1
        click_on "ひそひそ一覧"
        sleep 1
        expect(page).to have_content @other_user.name
        expect(page).to have_content @other_user2.name
      end
    end
  end

  describe "ダイレクトメッセージ機能" do

    before do
      visit post_path(@post)
      sleep 2
      click_on "ひそひそ"
      sleep 2
      click_on "開始する"
    end

    context "メッセージの投稿" do

      it "コンテントが空だとメッセージ投稿できない" do
        click_on "メッセージを送る"
        expect(page).to have_content "メッセージを入力してください"
      end

      it "コンテントが201文字以上だとメッセージを投稿できない" do
        fill_in "message[content]", with: ("a" * 201)
        click_on "メッセージを送る"
        expect(page).to have_content "メッセージは200文字以内で入力してください"
      end

      it "コンテントが1〜200文字以内ならメッセージを投稿できる" do
        fill_in "message[content]", with: "テストメッセージ"
        click_on "メッセージを送る"
        expect(page).to have_content "テストメッセージ"
      end
    end

    context "メッセージの削除" do

      it "メッセージは投稿者本人なら削除でき、削除すると一覧に表示されなくなる" do
        fill_in "message[content]", with: "テストメッセージ1"
        click_on "メッセージを送る"
        sleep 1
        fill_in "message[content]", with: "テストメッセージ2"
        click_on "メッセージを送る"
        sleep 1
        first(".btn-danger").click
        page.accept_confirm
        expect(page).not_to have_content "テストメッセージ1"
        expect(page).to have_content "テストメッセージ2"
      end
    end
  end
end