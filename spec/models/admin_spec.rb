require 'rails_helper'

RSpec.describe Admin, type: :model do
  let!(:admin) { create(:admin) }

  describe '#create' do
    it '有効なファクトリを持つこと' do
      expect(admin).to be_valid
    end
  end
end
