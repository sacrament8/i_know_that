# README

# 写真投稿によってそれが何か教えてもらうアプリ「I know that」

# 概要

あるモノの正体を知りたい人が画像と概要を投稿することで、他のユーザにそれが何かコメントで教えてもらう。<br>
投稿機能は登録ユーザのみの制限があり、投稿に対しての回答コメントは非登録ユーザにも可能

# versions

- ruby version 2.5.3
- rails version 5.2.3

# 機能一覧

- ログイン/ログアウト機能
- ユーザ登録機能
  - name, email, password(必須),avatar は空可
- 質問投稿機能
  - image, description(必須)
  - 登録ユーザのみが可能
- 質問状態変更機能(未解決/保留/解決)
  - 質問投稿者のみが削除可能
- 質問削除編集機能
  - 質問投稿者のみが削除編集可能
- 質問検索機能
  - ransack で質問レコードの description
    と title をあいまい検索
- 質問一覧表示機能
  - 9 件単位でページネーション
- (質問に対する回答)コメント投稿、編集、削除機能
  - 削除と編集は投稿者のみが可能
  - 同期処理で実装
- ダイレクトメッセージ投稿、削除機能
  - 非同期で実装予定
- フォロー状況一覧
  - 状態によって follow, followed, 相互の表示切り替え
  - ここに、DM 用のルームへのリンクボタンを表示

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

# 使用予定 gem

- 本番、開発
  - kaminari
  - ransack
  - devise
  - minimagick
  - dotenv-rails
  - (gem じゃないけど一応)ImageMagick
  - trix(気分で使わなくなるかも)
  - webpacker(trix 使うのであれば自動的に)
  - OmniAuth(余裕があれば)
- 開発
  - rails-pry
  - letter Opener
