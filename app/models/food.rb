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
end
