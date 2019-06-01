class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :content, presence: true, length: { in: 1..200 }
  validates :user_id, presence: true
  validates :room_id, presence: true
  validates_presence_of :content, :room_id, :user_id

  def message_time
    created_at.strftime("%Y/%m/%d at %l:%M %p")
  end
end
