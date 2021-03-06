class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, length: { in: 1..20 }
  validates :description, length: { in: 1..500 }
  validates :status, presence: true
  validates :image, presence: true
  enum status: [:未解決, :保留, :解決]
  # validates :image, file_size: { less_than: 5.megabytes, message: 'は5MB以下の物のみ投稿できます' },
  #                   file_content_type: { allow: ['image/jpeg', 'image/png'], message: 'はjpegまたはpng形式の物のみ投稿できます' }, on: :create
  def prepare_created_at
    self.created_at.strftime('%Y年%m月%d日')
  end

  scope :other_than_hold_posts, -> (ransack_params) { where.not(status: "保留").ransack(ransack_params) }
  def self.posts_paginate(target, page_params, per)
    target.result(distinct: true).order(created_at: :desc).page(page_params).per(per)
  end

end
