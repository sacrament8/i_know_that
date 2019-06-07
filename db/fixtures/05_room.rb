Room.seed do |s|
  s.id = 1
  s.sender_id = User.find(1).id
  s.recipient_id = User.find(11).id
end

Room.seed do |s|
  s.id = 2
  s.sender_id = User.find(1).id
  s.recipient_id = User.find(3).id
end