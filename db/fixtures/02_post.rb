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
  s.status = "解決"
end

Post.seed do |s|
  s.id = 4
  s.title = "岐阜デックと呼ばれているカードについて"
  s.description = "ネットではよく岐阜デックと呼ばれているようですが何か理由があるのでしょうか?\n知ってる人がいたら教えてください"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image18.jpg")
  s.user_id = User.find(1).id
  s.status = "解決"
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

Post.seed do |s|
  s.id = 7
  s.title = "前にどこかで見たお城"
  s.description = "前にクイズ番組か何かで見たと思うんですが何ていうお城だったか思い出せません\n知ってる人いませんか?"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image04.jpg")
  s.user_id = User.find(4).id
end

Post.seed do |s|
  s.id = 8
  s.title = "今年の夏の旅行で"
  s.description = "夏に友達と沖縄にいく計画を立てています\n沖縄 旅行と画像検索したら出てきたのですが\n何という場所か知ってる人いませんか?"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image05.jpg")
  s.user_id = User.find(5).id
end

Post.seed do |s|
  s.id = 9
  s.title = "お花見で撮った写真に"
  s.description = "メジロのような鳥が写っていたのですが\n調べてみるとメジロではなさそうです\n鳥に詳しい人がいたら教えてください"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image06.jpg")
  s.user_id = User.find(6).id
  s.status = "保留"
end

Post.seed do |s|
  s.id = 10
  s.title = "美味しそうなパンを見つけたのですが"
  s.description = "何という種類のパンなのか分からないので探せません\n近所のパン屋さんを探してみたのですが全滅でしたTT\nパンに詳しい人いたら教えてください!"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image07.jpg")
  s.user_id = User.find(7).id
end

Post.seed do |s|
  s.id = 11
  s.title = "元々大型犬が好きで"
  s.description = "仕事が安定して実家を出るのをキッカケに犬を飼おうと思っています\n元々大型犬が好きで、色々犬種を調べていたらこの画像を見つけました\n何という犬種かご存知の方がいましたら教えてください。"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image08.jpg")
  s.user_id = User.find(8).id
end

Post.seed do |s|
  s.id = 12
  s.title = "このジーパンのミニポケット"
  s.description = "私はたまに家の鍵を入れたりしていますが\n本来はちゃんとした使い方や意味があるんでしょうか?"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image09.jpg")
  s.user_id = User.find(9).id
end

Post.seed do |s|
  s.id = 13
  s.title = "この花の名前"
  s.description = "似たような花がたくさんあって素人目には何という花なのかわかりません\n花に詳しい人いませんか?"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image10.jpg")
  s.user_id = User.find(10).id
  s.status = "保留"
end

Post.seed do |s|
  s.id = 14
  s.title = "クラシックカー?"
  s.description = "この間近くのSAに寄った時見つけて思わす写真を撮ってしまいました\n車にはあまり詳しくないのですが所謂クラシックカーというものなのでしょうか?\n何という車種か知ってる人いませんか?"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image11.jpg")
  s.user_id = User.find(11).id
end

Post.seed do |s|
  s.id = 15
  s.title = "実家にある蔵を大掃除したとき"
  s.description = "去年の年末に実家の蔵を大掃除したところ出てきました\n値段が付きそうならと思いまだ捨てられていません\n骨董品などに詳しい方で何か気づか方がいましたら教えてください"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image12.png")
  s.user_id = User.find(12).id
end

Post.seed do |s|
  s.id = 16
  s.title = "有名な絵なのでしょうか?"
  s.description = "ネットで見つけたのですが何か引き込まれてしまいました\n有名な絵でしたら美術館で展示されていると思うので、有名な絵だった場合\n何という名前の絵か知ってる人いませんか?"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image13.jpg")
  s.user_id = User.find(13).id
end

Post.seed do |s|
  s.id = 17
  s.title = "台所の下の戸棚から"
  s.description = "賃貸マンションの水回りの掃除をしていたところ謎の部品を見つけました\n自分の物ではないので元からあったものだと思いますが捨てたらまずいでしょうか...\n何に使う部品か知ってる人いませんか?"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image14.jpg")
  s.user_id = User.find(14).id
end

Post.seed do |s|
  s.id = 18
  s.title = "実家にあった皿"
  s.description = "木箱に入っていて何か貴重そうな感じがしたのですが有名な皿だったりしないでしょうか?\n詳しいことを知ってる人がいたら教えてください!"
  s.image = File.open("#{Rails.root}/db/fixtures/image/image15.jpg")
  s.user_id = User.find(15).id
end