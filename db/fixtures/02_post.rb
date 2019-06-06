# テストユーザーのポスト
Post.seed do |s|
  s.id = 1
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image01.jpg")
  s.user_id = User.find(1).id
end

Post.seed do |s|
  s.id = 2
  s.title = "GOTO製のFRを使いたいのですが"
  s.description = "ESPのHORIZONのESPのFRが錆だらけになったので\n写真のGOTO製のFRを購入したいのですが\nHORIZONとの互換性はあるのでしょうか?\nまた使用されてる方がいましたら使用感など教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image16.jpg")
  s.user_id = User.find(1).id
  s.status = "保留"
end

Post.seed do |s|
  s.id = 3
  s.title = "海外ドラマでよく見るこの人"
  s.description = "海外ドラマのメンタリストを見ていたらよく見る役者さんが出てました\n主役というより脇役で色々なドラマでよく見かけるのですが\n有名な方なのでしょうか?"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image17.jpg")
  s.user_id = User.find(1).id
end

Post.seed do |s|
  s.id = 4
  s.title = "岐阜デックと呼ばれているカードについて"
  s.description = "ネットではよく岐阜デックと呼ばれているようですが何か理由があるのでしょうか?\n知ってる人がいたら教えてください"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image18.jpg")
  s.user_id = User.find(1).id
end

# その他のユーザーのポスト
Post.seed do |s|
  s.id = 5
  s.title = "旅行の行き先の候補に"
  s.description = "今月末に予定している旅行でgoogleの画像検索で\n良さそうな画像を見つけてそこに行くことにしました。\nそこで、調べているとこの建物の画像が出てきたのですが詳細がわかりません。\nどこにある建物か知ってる方いらっしゃらないでしょうか?"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image02.jpg")
  s.user_id = User.find(2).id
end

Post.seed do |s|
  s.id = 6
  s.title = "この画像の詳細"
  s.description = "この間ネットで見つけた画像なのですが、この画像をキッカケにカメラを買いました\n自分でもこんな写真を撮ってみたいのでどこで撮られたものかわかる人いませんか?"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image03.jpg")
  s.user_id = User.find(3).id
end
# ここから上まで完了
Post.seed do |s|
  s.id = 7
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image04.jpg")
  s.user_id = User.find(4).id
end

Post.seed do |s|
  s.id = 8
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image05.jpg")
  s.user_id = User.find(5).id
end

Post.seed do |s|
  s.id = 9
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image06.jpg")
  s.user_id = User.find(6).id
end

Post.seed do |s|
  s.id = 10
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image07.jpg")
  s.user_id = User.find(7).id
end

Post.seed do |s|
  s.id = 11
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image08.jpg")
  s.user_id = User.find(8).id
end

Post.seed do |s|
  s.id = 12
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image09.jpg")
  s.user_id = User.find(9).id
end

Post.seed do |s|
  s.id = 13
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image10.jpg")
  s.user_id = User.find(10).id
end

Post.seed do |s|
  s.id = 14
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image11.jpg")
  s.user_id = User.find(11).id
end

Post.seed do |s|
  s.id = 15
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image12.jpg")
  s.user_id = User.find(12).id
end

Post.seed do |s|
  s.id = 16
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image013.jpg")
  s.user_id = User.find(13).id
end

Post.seed do |s|
  s.id = 17
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image14.jpg")
  s.user_id = User.find(14).id
end

Post.seed do |s|
  s.id = 18
  s.title = "先日キャンプで見た鳥"
  s.description = "先日キャンプで鳥の写真を撮りました\n綺麗な鳥だったのですが何という名前の鳥なのでしょうか?\nご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image15.jpg")
  s.user_id = User.find(15).id
end