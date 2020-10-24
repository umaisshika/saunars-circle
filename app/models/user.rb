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

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲストユーザー'
    end
  end
end
