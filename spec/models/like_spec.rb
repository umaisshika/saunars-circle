require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { create(:like) }

  describe '#create' do
    it '有効なファクトリを持つこと' do
      expect(like).to be_valid
    end

    it '投稿がない場合、無効であること' do
      like.food_id = nil
      like.valid?
      expect(like).not_to be_valid
    end

    it 'ユーザーがない場合、無効であること' do
      like.user_id = nil
      like.valid?
      expect(like).not_to be_valid
    end
  end
end
