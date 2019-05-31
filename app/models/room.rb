class Room < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  # [:sender_id, :recipient_id]が同じ組み合わせで保存されないようにする
  validates_uniqueness_of :sender_id, scope: :recipient_id

  scope :between, -> (sender_id, recipient_id) do
    where("(rooms.sender_id = ? AND rooms.recipient_id = ?) OR (rooms.sender_id = ? AND rooms.recipient_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
  end

  def target_user(current_user)
    if sender_id == current_user.id
      User.find(recipient_id)
    elsif recipient_id == current_user.id
      User.find(sender_id)
    end
  end
  
end
