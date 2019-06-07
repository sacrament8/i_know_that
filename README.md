# README

# 写真投稿によりそれが何か教えてもらうアプリ<br>「I know that」

# コンセプト

あるモノの正体を知りたい人が画像と概要を投稿することで、他のユーザにそれが何かコメントで教えてもらう。<br>
投稿機能は登録ユーザのみの制限があり、投稿に対しての回答コメントは非登録ユーザにも可能

# ログインについて

ユーザー登録をしなくてもランディングページの「登録済みの方はこちら」から SignIn ページに進んでいただき
「テストユーザーでログイン」を押していただくことで、事前に用意した確認用ユーザーでログインしていただけます

- テスト用ユーザー情報
  - name: test-user
  - email: `test@test.com`
  - password: 111111

# versions

- ruby version 2.5.3
- rails version 5.2.3

# 機能一覧

- ログイン/ログアウト機能
- ユーザ登録機能
  - name(必須), email(必須), password(必須), avatar(空可)
- 質問投稿機能
  - image(必須), description(必須)
  - 登録ユーザのみが可能
- 質問状態変更機能(未解決/保留/解決)
  - 質問投稿者のみが削除可能
- 質問削除編集機能
  - 質問投稿者のみが削除編集可能
- 質問検索機能
  - ransack で質問レコードの description と title をあいまい検索
- 質問一覧表示機能
  - 9 件単位でページネーション
- (質問に対する回答)コメント投稿、編集、削除機能
  - 削除と編集は投稿者のみが可能
- ダイレクトメッセージ投稿、削除機能
- ユーザー間共有フォロー
  - 一方がフォローするとリンク状態になる
  - リンク状態のユーザー一覧機能
  - リンク状態ユーザー解除機能(双方から可能)
  - リンク状態ユーザー間の DM 機能

# カタログ設計

- https://docs.google.com/spreadsheets/d/1HnqpuxBeQL54mTTrtNO-aGdSj9v5agq361aVckbnG-U/edit#gid=1140406435

# テーブル定義

- https://docs.google.com/spreadsheets/d/1HnqpuxBeQL54mTTrtNO-aGdSj9v5agq361aVckbnG-U/edit#gid=762360931

# ER 図

- https://cacoo.com/diagrams/IvG18huciJj9bjFO/4787C

# 画面遷移図

- https://cacoo.com/diagrams/IvG18huciJj9bjFO/F3AB1

# ワイヤーフレーム

- https://cacoo.com/diagrams/IvG18huciJj9bjFO/F171A

# 使用 gem

- 本番、開発
  - kaminari
  - ransack
  - devise
  - minimagick
  - dotenv-rails
  - rails-i18n
  - shrine
  - file_validators
  - faker
  - seed-fu
  - rails-i18n
  - image_processing
  - aws-sdk-s3
- 開発, テスト
  - rails-pry
  - bullet
  - factory_bot_rails
  - database_cleaner
  - spring-commands-rspec
  - webdrivers
