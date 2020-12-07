require 'rails_helper'

RSpec.describe Food, type: :model do
  describe '#create' do
    it '有効なファクトリを持つこと' do
      food = build(:food)
      expect(food).to be_valid
    end

    it 'エリアがないためエラーになる' do
      food = build(:food, prefecture_id: nil)
      expect(food.valid?).to eq(false)
    end

    it '画像がないためエラーになる' do
      food = build(:food, image: nil)
      expect(food.valid?).to eq(false)
    end

    it '品名がないためエラーになる' do
      food = build(:food, name: nil)
      expect(food.valid?).to eq(false)
    end

    it '品名が21文字以上でエラーになる' do
      food = build(:food, name: ('a' * 21))
      expect(food.valid?).to eq(false)
    end

    it 'ひとことが201文字以上でエラーになる' do
      food = build(:food, description: ('a' * 201))
      expect(food.valid?).to eq(false)
    end

    it 'サウナが21文字以上でエラーになる' do
      food = build(:food, visited_sauna: ('a' * 21))
      expect(food.valid?).to eq(false)
    end
  end
end
