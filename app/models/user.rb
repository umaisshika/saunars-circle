class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # emailを小文字に変換
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 240 }

  mount_uploader :avatar, AvatarUploader

  enum gender: { 男性: 0, 女性: 1, 無回答: 2 }

  belongs_to_active_hash :prefecture
  has_many :foods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_foods, through: :likes, source: :food
  has_many :relationships, class_name: 'Relationship', foreign_key: 'user_id', dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  def already_liked?(food)
    likes.exists?(food_id: food.id)
  end

  def follow(other_user)
    unless self == other_user
      relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = relationships.find_by(follow_id: other_user.id)
    relationship.destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  def feed
    following_ids = "SELECT follow_id FROM relationships
                      WHERE user_id = :user_id"
    Food.where("user_id IN (#{following_ids})
        OR user_id = :user_id", user_id: id)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲストユーザー'
    end
  end

  def create_notification_follow!(current_user)
    # 過去にフォローしたことがある場合は、nilを返す
    already_follow = Notification.where(visitor_id: current_user.id, visited_id: id, action: 'follow')
    return nil if already_follow.present?

    notification = current_user.active_notifications.new(
      visited_id: id,
      action: 'follow'
    )
    notification.save if notification.valid?
  end
end
