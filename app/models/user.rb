class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts, dependent: :destroy
  has_many :active_relations, foreign_key: 'follower_id', class_name: 'Relation', dependent: :destroy
  has_many :passive_relations, foreign_key: 'followed_id', class_name: 'Relation', dependent: :destroy
  has_many :following, through: :active_relations, source: :followed
  has_many :followers, through: :passive_relations, source: :follower
  mount_uploader :avatar, AvatarUploader
  validates :name, length: { in: 2..25 }
  validates :avatar, file_size: { less_than: 5.megabytes, message: 'は5MB以下の画像のみ使用できます' },
                     file_content_type: { allow: ['image/jpeg', 'image/png'], message: 'はjpegまたはpng形式の物のみ使用できます' }
  

  #指定のユーザをフォローする
  def follow!(other_user)
    active_relations.create!(followed_id: other_user.id)
  end

  #フォローしているかどうかを確認する
  def following?(other_user)
    active_relations.find_by(followed_id: other_user.id)
  end

  def followed?(other_user)
    passive_relations.find_by(follower_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relations.find_by(followed_id: other_user.id).destroy
  end

  def reverse_unfollow!(other_user)
    passive_relations.find_by(follower_id: other_user.id).destroy
  end
end
