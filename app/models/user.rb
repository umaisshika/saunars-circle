class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # emailを小文字に変換
  before_save { self.email = email.downcase }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i.freeze
  validates :password, :password_confirmation,       allow_blank: true, format: { with: VALID_PASSWORD_REGEX }
  validates :name,                                   presence: true, length: { maximum: 15 }

  mount_uploader :avatar, AvatarUploader

  enum gender: { 男性: 0, 女性: 1, 無回答: 2 }
  
  belongs_to_active_hash :prefecture
end
