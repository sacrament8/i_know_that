class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  include ImageUploader::Attachment.new(:image)
  validates :title, presence: true, length: { in: 1..30 }
  validates :description, presence: true, length: { in: 1..1000 }
  validates :status, presence: true
  validates :image, presence: true
  enum status: [:未解決, :保留, :解決]

  def prepare_created_at
    self.created_at.strftime('%Y年%m月%d日')
  end
end
