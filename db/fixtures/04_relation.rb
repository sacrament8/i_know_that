Relation.seed do |s|
  s.id = 1
  s.follower_id = User.find(1).id
  s.followed_id = User.find(11).id
end

Relation.seed do |s|
  s.id = 2
  s.follower_id = User.find(1).id
  s.followed_id = User.find(3).id
end