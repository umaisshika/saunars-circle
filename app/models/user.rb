class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # emailを小文字に変換
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 15 }

  mount_uploader :avatar, AvatarUploader

  enum gender: { 男性: 0, 女性: 1, 無回答: 2 }

  belongs_to_active_hash :prefecture
  has_many :foods
  has_many :comments, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_foods, through: :likes, source: :food

  def already_liked?(food)
    likes.exists?(food_id: food.id)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲストユーザー'
    end
  end
end
