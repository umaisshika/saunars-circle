class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :content, presence: true, length: { maximum: 240 }
end
