require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:user) { create(:user) }
  let!(:food) { create(:food, user: user) }
  let!(:like) { create(:like, user: user, food: food) }

  describe '#create' do
    it '有効なファクトリを持つこと' do
      expect(like).to be_valid
    end

    it '投稿がない場合は無効であること' do
      like.food = nil
      like.valid?
      expect(like.errors).to be_added(:food, :blank)
    end

    it 'ユーザーがない場合は無効であること' do
      like.user = nil
      like.valid?
      expect(like.errors).to be_added(:user, :blank)
    end
  end
end
