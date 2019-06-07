# post_id: 1に対するcomment
Comment.seed do |s|
  s.id = 1
  s.content = "ルリビタキ...ではないでしょうし何でしょうか、私も気になります"
  s.post_id = Post.find(1).id
  s.user_id = User.find(4).id
end

Comment.seed do |s|
  s.id = 2
  s.content = "オオルリっぽく見えますがどうでしょうか?"
  s.post_id = Post.find(1).id
  s.user_id = User.find(5).id
end

# post_id: 3に対するcomment
Comment.seed do |s|
  s.id = 3
  s.content = "フレッド・コーラーは有名ですよ-"
  s.post_id = Post.find(3).id
  s.user_id = User.find(8).id
end

Comment.seed do |s|
  s.id = 4
  s.content = "フレデリック・コーラーさんは名脇役ですよね\nレギュラー出演もないわけでは無いですがやはりゲスト出演が多いみたいです\n狂気的な内心を持つおどおどした人物の演技がすごくうまい役者さんですよね"
  s.post_id = Post.find(3).id
  s.user_id = User.find(11).id
end

Comment.seed do |s|
  s.id = 5
  s.content = "やはり有名な役者さんだったんですね!\n急に本性を表す演技が鳥肌たちましたw\nお二方回答ありがとうございました"
  s.post_id = Post.find(3).id
  s.user_id = User.find(1).id
end

# post_id: 4に対するcomment
Comment.seed do |s|
  s.id = 6
  s.content = "岐阜開催の大会で配られたデックのため、岐阜城と鮎が描かれていました\nそこに、デックの質が高く使いやすかったので岐阜デックと呼ばれるようになり絶対数も少なく\nプレミア価格でネットが売られることが多くなり今に至るようです"
  s.post_id = Post.find(4).id
  s.user_id = User.find(3).id
end

Comment.seed do |s|
  s.id = 7
  s.content = "回答ありがとうございます!\n有名になった経緯まで説明してくれて勉強になりました!\n興味あったのですが購入は見送ろうと思います"
  s.post_id = Post.find(4).id
  s.user_id = User.find(1).id
end

# post_id: 5に対するcomment
Comment.seed do |s|
  s.id = 8
  s.content = "横浜の赤煉瓦倉庫ではないでしょうか?\n関内駅かみなとみらい駅が最寄りだったと思います"
  s.post_id = Post.find(5).id
  s.user_id = User.find(12).id
end

# post_id: 6に対するcomment
Comment.seed do |s|
  s.id = 9
  s.content = "確かに思わず撮りたくなる光景ですよね\n鳥居がずらっと並んでいるところを見ると伏見稲荷大社っぽいですが、他にもこういう神社はあるんですかね?"
  s.post_id = Post.find(6).id
  s.user_id = User.find(14).id
end

# post_id: 8に対するcomment
Comment.seed do |s|
  s.id = 10
  s.content = "沖縄にある首里城の守礼門だと思いますよ\n那覇バスターミナルからバスで30分くらいで付くみたいです\n旅行楽しめるといいですね"
  s.post_id = Post.find(8).id
  s.user_id = User.find(1).id
end

# post_id: 10に対するcomment
Comment.seed do |s|
  s.id = 21
  s.content = "パンというよりタルトタタンとかフロランタンっぽく見える..."
  s.post_id = Post.find(10).id
  s.user_id = User.find(11).id
end

# post_id: 11に対するcomment
Comment.seed do |s|
  s.id = 11
  s.content = "テリアっぽい顔してるけどなんだろう?"
  s.post_id = Post.find(11).id
  s.user_id = User.find(2).id
end

# post_id: 12に対するcomment
Comment.seed do |s|
  s.id = 12
  s.content = "当時、世の中は懐中時計が主流で英語では「ポケットウォッチ」と呼ばれ、名前の通りポケットに入れる時計でした\nつまりジーンズにつけられた小さなポケットは、元々懐中時計を入れるためのものだったようです\nその後、腕時計が普及しポケットはサイズダウンされ、その名も「ウォッチポケット」ではなく\n小銭やライターを入れる「コインポケット」と呼ばれるようになりました"
  s.post_id = Post.find(12).id
  s.user_id = User.find(7).id
end

Comment.seed do |s|
  s.id = 13
  s.content = "元々は懐中時計いれだったんですねスッキリしました!\n使い方もそんなに間違いではなかったですね(笑)"
  s.post_id = Post.find(12).id
  s.user_id = User.find(9).id
end

# post_id: 16に対するcomment
Comment.seed do |s|
  s.id = 14
  s.content = "画家のエドワード・バーン＝ジョーンズによって描かれたヴィーナスの鏡という作品ですね\nポルトガルのリスボンにあるグルベンキアン美術館に所蔵されているようなので\n見に行くのは大変かもしれません"
  s.post_id = Post.find(16).id
  s.user_id = User.find(6).id
end

Comment.seed do |s|
  s.id = 15
  s.content = "教えてくださってありがとうございます\n海外にあるとのことで見に行けないのは残念ですが\nこの絵が載っている画集を買ってみようと思います!"
  s.post_id = Post.find(16).id
  s.user_id = User.find(13).id
end

# post_id: 17に対するcomment
Comment.seed do |s|
  s.id = 16
  s.content = "家のマンションにもありました...\n何の部品なんなのでしょうか、気になります"
  s.post_id = Post.find(17).id
  s.user_id = User.find(2).id
end

Comment.seed do |s|
  s.id = 17
  s.content = "他の方のマンションにもあるという事は前の住人の忘れ物ではなく\nやはりマンションの公共物なんでしょうか..."
  s.post_id = Post.find(17).id
  s.user_id = User.find(14).id
end

Comment.seed do |s|
  s.id = 18
  s.content = "ル・クルーゼやストウブといった鋳物琺瑯のお鍋についてくるやつです\n収納する時に鍋の縁に挟み、鍋本体と蓋が直接くっつかないようにし、錆を防ぎます。"
  s.post_id = Post.find(17).id
  s.user_id = User.find(8).id
end

Comment.seed do |s|
  s.id = 19
  s.content = "まさか知ってる人がいるとは!\nということは備え付けのものではなく前の住人の方が置いてったものでしょうね\n心置きなく捨てられますありがとうございました!"
  s.post_id = Post.find(17).id
  s.user_id = User.find(14).id
end

Comment.seed do |s|
  s.id = 20
  s.content = "ただの九谷焼きっぽいけど...\n特に有名なやつっぽくないから2,3000円もつけばいい感じじゃないですか?"
  s.post_id = Post.find(18).id
  s.user_id = User.find(2).id
end