require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:relationship) { create(:relationship) }

  describe '#create' do
    it '有効なファクトリを持つこと' do
      expect(relationship).to be_valid
    end

    it 'フォローするIDがない場合、無効であること' do
      relationship.follow_id = nil
      expect(relationship).not_to be_valid
    end

    it 'フォローされるIDがない場合、無効であること' do
      relationship.user_id = nil
      expect(relationship).not_to be_valid
    end
  end
end
