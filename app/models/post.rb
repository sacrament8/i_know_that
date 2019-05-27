class Post < ApplicationRecord
  belongs_to :user
  include ImageUploader::Attachment.new(:image)
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :image, presence: true
end
