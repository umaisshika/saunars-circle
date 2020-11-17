class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :notifications, dependent: :destroy

  validates :content, presence: true, length: { maximum: 240 }
end
