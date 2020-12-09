require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:relationship) { create(:relationship) }

  describe '#create' do
    it '有効なファクトリを持つこと' do
      expect(relationship).to be_valid
    end

    it 'フォローするIDがない場合、無効であること' do
      relationship.follow_id = nil
      relationship.valid?
      expect(relationship.errors).to be_added(:follow_id, :blank)
    end

    it 'フォローされるIDがない場合、無効であること' do
      relationship.user_id = nil
      relationship.valid?
      expect(relationship.errors).to be_added(:user_id, :blank)
    end
  end
end
