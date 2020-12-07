require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }

  it '有効なファクトリを持つこと' do
    expect(comment).to be_valid
  end

  it 'コメント、投稿、ユーザーがある場合、有効であること' do
    user = create(:user)
    food = create(:food)
    comment = Comment.new(
      content: 'content',
      food: food,
      user: user
    )
    expect(comment).to be_valid
  end

  describe '存在性の検証' do
    it 'コメントがない場合、無効であること' do
      comment.content = nil
      comment.valid?
      expect(comment).to_not be_valid
    end

    it '投稿がない場合、無効であること' do
      comment.food = nil
      comment.valid?
      expect(comment).to_not be_valid
    end

    it 'ユーザーがない場合、無効であること' do
      comment.user = nil
      comment.valid?
      expect(comment).to_not be_valid
    end
  end

  describe '文字数の検証' do
    it 'コメントが240文字以内の場合、有効であること' do
      comment.content = 'a' * 240
      expect(comment).to be_valid
    end

    it 'コメントが151文字以上の場合、登録できないこと' do
      comment.content = 'a' * 241
      expect(comment).to_not be_valid
    end
  end
end
