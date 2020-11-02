require 'rails_helper'

RSpec.describe 'ユーザー登録', type: :model do
  describe '#create' do
    it 'userモデル項目全て存在すれば登録できる' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it 'nameがない場合は登録できないこと' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end

    it 'nameが15文字以下の場合は登録できること' do
      user = build(:user)
      user.name = 'a' * 15
      user.valid?
      expect(user).to be_valid
    end

    it 'nameが16文字以上の場合は登録できないこと' do
      user = build(:user)
      user.name = 'a' * 16
      user.valid?
      expect(user).not_to be_valid
    end

    it 'emailがない場合は登録できないこと' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it '重複したemailが存在する場合登録できないこと' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('はすでに存在します')
    end

    it 'passwordが無いと登録できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include('を入力してください')
    end

    it 'passwordが７文字以下の時は登録できないこと' do
      user = build(:user, password: 'hoge36')
      user.valid?
      expect(user.errors[:password]).to_not match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i)
    end

    it 'passwordが英字と英数字を含まない時は登録できないこと' do
      user = build(:user, password: 'aaaaaaa')
      user.valid?
      expect(user.errors[:password]).to_not match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i)
    end

    it 'passwordが英字と英数字を含まない時は登録できないこと' do
      user = build(:user, password: '1111111')
      user.valid?
      expect(user.errors[:password]).to_not match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i)
    end
  end
end
