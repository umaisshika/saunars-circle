class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # emailを小文字に変換
  before_save { self.email = email.downcase }
  VALID_PASSWORD_REGEX =              /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i
  validates :password, :password_confirmation,       allow_blank: true, format: { with: VALID_PASSWORD_REGEX }
  validates :name,                                   presence: true, length: {maximum: 50}
end
