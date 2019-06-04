class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :content, length: { maximum: 200 }
  validates_presence_of :content, :room_id, :user_id

  def message_time
    created_at.strftime("%Y/%m/%d at %l:%M %p")
  end
end
