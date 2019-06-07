require "rails_helper"

describe "質問投稿機能", type: :system do

  context "ログイン時" do
    before do
      @user = User.create(name: "test-user", email: "test@test.com", password: "111111")
      visit new_user_session_path
      click_on "テストユーザーでログイン"
    end
    context "新規作成時" do

      it "画像選択、質問タイトル、質問内容を記入していれば投稿可能" do
        visit new_post_path
        attach_file "post[image]", "#{Rails.root}/spec/fixtures/image/flower.jpg"
        fill_in "質問タイトル", with: "テストタイトル"
        fill_in "質問内容", with: "テストコンテント"
        click_on "質問する"
        expect(page).to have_content "質問に成功しました"
      end

      it "画像が選択されていないと投稿できない" do
        visit new_post_path
        fill_in "質問タイトル", with: "テストタイトル"
        fill_in "質問内容", with: "テストコンテント"
        click_on "質問する"
        expect(page).to have_content "画像を入力してください"
      end
      it "質問タイトルがないと投稿できない" do
        visit new_post_path
        attach_file "post[image]", "#{Rails.root}/spec/fixtures/image/flower.jpg"
        fill_in "質問タイトル", with: ""
        fill_in "質問内容", with: "テストコンテント"
        click_on "質問する"
        expect(page).to have_content "タイトルは1文字以上で入力してください"
      end

      it "質問タイトルが21文字以上投稿できない" do
        visit new_post_path
        attach_file "post[image]", "#{Rails.root}/spec/fixtures/image/flower.jpg"
        fill_in "質問タイトル", with: ("a" * 21)
        fill_in "質問内容", with: "テストコンテント"
        click_on "質問する"
        expect(page).to have_content "タイトルは20文字以内で入力してください"
      end

      it "質問内容がないと投稿できない" do
        visit new_post_path
        attach_file "post[image]", "#{Rails.root}/spec/fixtures/image/flower.jpg"
        fill_in "質問タイトル", with: "テストタイトル"
        fill_in "質問内容", with: ""
        click_on "質問する"
        expect(page).to have_content "質問内容は1文字以上で入力してください"
      end

      it "質問内容が501文字以上だと投稿できない" do
        visit new_post_path
        attach_file "post[image]", "#{Rails.root}/spec/fixtures/image/flower.jpg"
        fill_in "質問タイトル", with: "テストタイトル"
        fill_in "質問内容", with: ("a" * 501)
        click_on "質問する"
        expect(page).to have_content "質問内容は500文字以内で入力してください"
      end

    end

    context "投稿編集時" do
      before do
        @post = create(:post, user_id: @user.id)
      end

      context "投稿者本人" do

        it "投稿詳細に編集ボタンが表示される" do
          visit post_path(@post)
          expect(page).to have_content "編集する"
        end
        # 重くてよく落ちるのでコメントに(調子がいいと通るのでテスト自体はOK)
        it "記入に漏れがなければ画像を変更できる" do
          visit post_path(@post)
          click_on "編集する"
          sleep 4
          attach_file "post[image]", "#{Rails.root}/spec/fixtures/image/animal.jpeg"
          sleep 2
          click_on "編集する"
          expect(page).to have_content "編集に成功しました"
        end

        it "記入に漏れがなければ質問タイトルを変更できる" do
          visit post_path(@post)
          sleep 1
          click_on "編集する"
          sleep 2
          attach_file "post[image]", "#{Rails.root}/spec/fixtures/image/flower.jpg"
          sleep 2
          fill_in "質問タイトル", with: "タイトルを変更しました"
          sleep 1
          click_on "編集する"
          sleep 1
          expect(page).to have_content "タイトルを変更しました"
        end

        it "記入に漏れがなければ質問内容を変更できる" do
          visit post_path(@post)
          click_on "編集する"
          sleep 2
          attach_file "post[image]", "#{Rails.root}/spec/fixtures/image/flower.jpg"
          sleep 2
          fill_in "質問内容", with: "質問内容を変更しました"
          click_on "編集する"
          expect(page).to have_content "質問内容を変更しました"
        end

      end

      context "投稿者ではない" do
        before do
          @post = create(:post, user_id: @user.id)
          visit user_path(@user)
          find(".navbar-toggler-icon").click
          click_on "#{@user.name}"
          click_on "SignOut"
        end
        it "投稿詳細に編集ボタンが表示されない" do
          visit post_path(@post)
          expect(page).not_to have_content "編集する"
        end
      end

    end

    context "投稿削除時" do
      before do
        @post = create(:post, user_id: @user.id)
      end
      context "投稿者本人" do

        it "削除ボタンが表示される" do
          visit post_path(@post)
          expect(page).to have_content "削除する"
        end

        it "投稿削除後は一覧にリダイレクトされ、投稿は表示されない" do
          visit post_path(@post)
          sleep 1
          click_on "削除する"
          page.accept_confirm
          sleep 1
          expect(page).not_to have_content @post.title
        end

      end

      context "投稿者ではない" do
        before do
          @post = create(:post, user_id: @user.id)
          visit user_path(@user)
          find(".navbar-toggler-icon").click
          click_on "#{@user.name}"
          click_on "SignOut"
        end

        it "投稿詳細に削除ボタンが表示されない" do
          visit post_path(@post)
          expect(page).not_to have_content "削除する"
        end
      end
    end
  end

  context "非ログイン時" do

    before do
      @user = User.create(name: "test-user", email: "test@test.com", password: "111111")
      visit new_user_session_path
      click_on "テストユーザーでログイン"
      @post = create(:post, user_id: @user.id)
      visit user_path(@user)
      find(".navbar-toggler-icon").click
      click_on "#{@user.name}"
      click_on "SignOut"
    end

    context "新規作成時" do
      it "非ログインユーザーであれば質問リンクが出ない" do
        visit root_path
        click_on "登録しないで利用(機能制限)"
        expect(page).not_to have_content "みんなに質問する"
      end
    end

    context "投稿編集時" do
      it "投稿詳細で編集リンクが表示されない" do
        visit post_path(@post)
        expect(page).not_to have_content "編集する"
      end
    end

    context "投稿削除時" do
      it "投稿詳細で削除リンクが表示されない" do
        visit post_path(@post)
        expect(page).not_to have_content "削除する"
      end
    end

  end

end

describe "投稿一覧画面", type: :system do
  before do
    @user = create(:user)
    @post_a = create(:test_post, user_id: @user.id)
    @post_b = create(:test_post, user_id: @user.id)
    @post_c = create(:test_post, user_id: @user.id)
    visit new_user_session_path
    click_on "テストユーザーでログイン"
    visit posts_path
  end

  describe "投稿一覧機能" do

    it "最新の投稿が一番最初に表示される(投稿日時降順)" do
      expect(first(".card-title")).to have_content @post_c.title
    end

    it "投稿した未解決状態の投稿全て表示される" do
      expect(page).to have_content @post_a.title
      expect(page).to have_content @post_b.title
      expect(page).to have_content @post_c.title
    end

    it "保留状態の投稿は一覧に表示されない" do
      @post_c.update_attributes(status: "保留", title: "保留に変更", description: "hoge")
      visit posts_path
      expect(page).to have_content @post_a.title
      expect(page).to have_content @post_b.title
      expect(page).not_to have_content @post_c.title

    end
  end

  describe "投稿ソート検索機能" do

    it "何もしなければ投稿日時降順" do
      expect(first(".card-title")).to have_content @post_c.title
      expect(all(:css, ".card-title").last).to have_content @post_a.title
    end
  
    it "ボタンを押すと投稿日時昇順" do
      click_on "投稿日時でソート"
      sleep 2
      expect(first(".card-title")).to have_content @post_a.title
      expect(all(:css, ".card-title").last).to have_content @post_c.title
  
    end
  
    it "ボタンを押した状態でもう一度押すと降順に戻る" do
      click_on "投稿日時でソート"
      sleep 2
      click_on "投稿日時でソート"
      sleep 2
      expect(first(".card-title")).to have_content @post_c.title
      expect(all(:css, ".card-title").last).to have_content @post_a.title
  
    end

    it "タイトルか質問内容をあいまい検索して一覧に表示" do
      fill_in "q[description_or_title_cont]", with: @post_b.title
      click_on "検索"
      sleep 1
      expect(page).not_to have_content @post_a.title
      expect(page).to have_content @post_b.title
      expect(page).not_to have_content @post_c.title
    end
  end
end

describe "投稿に対するコメント機能" do
  before do
    @user = User.create(name: "test-user", email: "test@test.com", password: "111111")
    visit new_user_session_path
    click_on "テストユーザーでログイン"
    @post = create(:post, user_id: @user.id)
  end

  context "ログイン時" do
    it "contentが空だと投稿不可" do
      visit post_path(@post)
      fill_in "comment[content]", with: ""
      click_on "回答する"
      expect(page).to have_content "回答を入力してください"
    end

    it "conetntが501文字以上なら投稿不可" do
      visit post_path(@post)
      fill_in "comment[content]", with: ("a" * 501)
      click_on "回答する"
      expect(page).to have_content "回答は500文字以内で入力してください"
    end

    it "conetntが1〜500文字なら投稿可能" do
      visit post_path(@post)
      fill_in "comment[content]", with: ("テスト回答")
      click_on "回答する"
      expect(page).to have_content "テスト回答"
    end

    it "自分の回答なら削除できる" do
      visit post_path(@post)
      fill_in "comment[content]", with: ("テスト回答")
      click_on "回答する"
      sleep 1
      page.all(".btn-danger")[1].click
      sleep 1
      page.accept_confirm
      sleep 1
      expect(page).not_to have_content "テスト回答"
    end

  end

  context "非ログイン時" do
    before do
      visit user_path(@user)
      find(".navbar-toggler-icon").click
      click_on "#{@user.name}"
      click_on "SignOut"
    end

    it "contentが空または500文字以内なら投稿できるが表示名が名無しさんになる" do
      visit post_path(@post)
      fill_in "comment[content]", with: ("テスト回答")
      click_on "回答する"
      expect(page).to have_content "名無しさん"
    end

  end
end