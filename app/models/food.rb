class Food < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :description,                   length: { maximum: 200 }
  validates :name,          presence: true, length: { maximum: 20 }
  validates :visited_sauna, presence: true, length: { maximum: 20 }
  validates :prefecture_id, presence: true
  validates :image,         presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to_active_hash :prefecture
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :notifications, dependent: :destroy

  def create_notification_like!(current_user)
    notification = current_user.active_notifications.new(
      food_id: id,
      visited_id: user_id,
      action: 'like'
    )
    notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(food_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      food_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
