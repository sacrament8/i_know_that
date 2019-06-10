require "rails_helper"

describe "ランディングページの機能テスト", type: :system do
  describe "リンク機能" do
    before do
      visit root_path
    end

    it "ユーザー登録リンク" do
      click_on "ユーザー登録"
      expect(page).to have_content "パスワードは6 文字以上必要です"
    end

    it "登録済みの方はこちらリンク" do
      click_on "登録済みの方はこちら"
      expect(page).to have_content "こちらで用意したテストユーザーでログインいただけます"
    end

    it "登録しないで利用(機能制限)リンク" do
      click_on "登録しないで利用(機能制限)"
      find(".navbar-toggler").click
      expect(page).to have_content "名無しさん"
    end

    it "GitHubへの外部リンク" do
      click_on "GitHub"
      expect(current_url).to eq "https://github.com/sacrament8/i_know_that"
    end

  end

  describe "ログイン機能" do
    context "sigin up前" do

      it "登録してない情報ではログインできない" do
        visit new_user_session_path
        fill_in "メールアドレス", with: "hogehoge@test.com"
        fill_in "パスワード", with: "asdfggreaga"
        click_on "サインイン"
        expect(page).to have_content "メールアドレス もしくはパスワードが不正です"
      end

      it "ユーザー登録後はマイページにリダイレクト" do
        visit new_user_registration_path
        fill_in "お名前", with: "test-user"
        fill_in "メールアドレス", with: "example@test.com"
        fill_in "パスワード", with: "111111"
        fill_in "パスワード(確認)", with: "111111"
        click_on "ユーザー登録"
        user = User.find_by(name: "test-user")
        expect(current_path).to eq user_path(user)
      end

      it "テストユーザーでログインボタン機能" do
        # テストユーザー要のアカウントを作成
        user = create(:user)
        visit new_user_session_path
        sleep 1
        click_on "テストユーザーでログイン"
        sleep 1
        expect(page).to have_content user.name
      end

    end

    context "sigin up後" do
      before do
        @user = User.create(name: "test-user", email: "example@test.com", password: "111111")
      end

      it "登録済みのアカウントでサインイン" do
        visit new_user_session_path
        fill_in "メールアドレス", with: "example@test.com"
        fill_in "パスワード", with: "111111"
        click_on "サインイン"
        expect(current_path).to eq user_path(@user)
      end
  
      it "ハンバーガーのSignOutからサインアウト後ランディングページにリダイレクト" do
        visit new_user_session_path
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_on "サインイン"
        find(".navbar-toggler").click
        click_on @user.name
        click_on "SignOut"
        expect(current_path).to eq root_path
      end
    end
  end
end