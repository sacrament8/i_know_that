# フレッドコーラーとのDM
Message.seed do |s|
  s.id = 1
  s.content = "回答ありがとうございました!\nフレッドコーラーに詳しいようでしたのでDMさせてもらいました\n彼の出ている作品でおすすめありませんか?"
  s.room_id = Room.find(1).id
  s.user_id = User.find(1).id
  s.read = true
end

Message.seed do |s|
  s.id = 2
  s.content = "最近だとGRIMMなんかが面白かったです\n全然脇役なんでフレッド自体は目立っていませんがw"
  s.room_id = Room.find(1).id
  s.user_id = User.find(11).id
  s.read = true
end

Message.seed do |s|
  s.id = 3
  s.content = "フレッド自体は目立っていなくても、彼が出ている作品はあたり多いので楽しみです\n早速見てみます、ありがとうございます!"
  s.room_id = Room.find(1).id
  s.user_id = User.find(1).id
  s.read = true
end
# 岐阜デックとのDM
Message.seed do |s|
  s.id = 4
  s.content = "岐阜デックの件で質問させていただいたものですが\nカードに詳しそうなので質問いいですか?"
  s.room_id = Room.find(2).id
  s.user_id = User.find(1).id
  s.read = true
end

Message.seed do |s|
  s.id = 5
  s.content = "いいですよー"
  s.room_id = Room.find(2).id
  s.user_id = User.find(3).id
  s.read = true
end

Message.seed do |s|
  s.id = 6
  s.content = "ありがとうこざいます!\n最近カードマジックを始めたのですがおすすめのデックとかありませんか?"
  s.room_id = Room.find(2).id
  s.user_id = User.find(1).id
  s.read = true
end

Message.seed do |s|
  s.id = 7
  s.content = "強度を気にしない使いやすさ追求するならバイシクルのエリート\n強度もある程度求めたいならバイシクルのゴールドスタンダードですかね"
  s.room_id = Room.find(2).id
  s.user_id = User.find(3).id
  s.read = true
end

Message.seed do |s|
  s.id = 8
  s.content = "ありがとうこざいます!\n頻繁に買い換えるのはお財布に痛いので\nゴールドスタンダードを購入してみますありがとうございます!"
  s.room_id = Room.find(2).id
  s.user_id = User.find(1).id
  s.read = true
end