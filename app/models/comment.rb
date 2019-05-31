class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true
  validates :content, presence: true, length: { in: 1..500 }
  validates :post_id, presence: true
  validates :user_id, presence: true
end
