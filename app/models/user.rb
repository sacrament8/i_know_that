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
  validates :name, presence: true, length: { in: 2..25 }
  include AvatarUploader::Attachment.new(:avatar)

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
end
