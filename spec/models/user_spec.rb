require 'rails_helper'

RSpec.describe 'User', type: :model do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  describe 'validates' do
    it 'userモデル項目全て存在すれば登録できる' do
      expect(user).to be_valid
    end

    it 'nameがない場合は登録できないこと' do
      user.name = nil
      user.valid?
      expect(user.errors).to be_added(:name, :blank)
    end

    it 'nameが15文字以下の場合は登録できること' do
      user.name = 'a' * 15
      expect(user).to be_valid
    end

    it 'nameが16文字以上の場合は登録できないこと' do
      user.name = 'a' * 16
      user.valid?
      expect(user.errors).to be_added(:name, :too_long, count: 15)
    end

    it 'emailが255文字以下なら有効であること' do
      user.email = "#{'a' * 243}@example.com"
      expect(user).to be_valid
    end

    it 'emailが255文字を超えるなら無効であること' do
      user.email = "#{'a' * 244}@example.com"
      user.valid?
      expect(user.errors).to be_added(:email, :too_long, count: 255)
    end

    it 'emailがない場合は登録できないこと' do
      user.email = nil
      user.valid?
      expect(user.errors).to be_added(:email, :blank)
    end

    it '重複したemailが存在する場合登録できないこと' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors).to be_added(:email, :taken, value: user.email)
    end

    it 'メールアドレスに@が含まれていないなら無効な状態であること' do
      user.email = 'samplesample.jp'
      user.valid?
      expect(user.errors).to be_added(:email, :invalid, value: user.email)
    end

    it 'emailは全て小文字で保存される' do
      user.email = 'SAMPLE@SAMPLE.JP'
      user.save!
      expect(user.reload.email).to eq 'sample@sample.jp'
    end

    it 'passwordが無いと登録できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors).to be_added(:password, :blank)
    end

    it 'passwordが6文字以上なら有効であること' do
      user.password = user.password_confirmation = 'a' * 6
      expect(user).to be_valid
    end

    it 'passwordが6文字未満なら無効であること' do
      user.password = user.password_confirmation = 'a' * 5
      user.valid?
      expect(user.errors).to be_added(:password, :too_short, count: 6)
    end

    it 'passwordが128文字を超えるなら無効であること' do
      user.password = user.password_confirmation = 'a' * 129
      user.valid?
      expect(user.errors).to be_added(:password, :too_long, count: 128)
    end

    it 'descriptionが240文字以下なら有効であること' do
      user.description = 'a' * 240
      expect(user).to be_valid
    end

    it 'descriptionが240文字を超えるなら無効であること' do
      user.description = 'a' * 241
      user.valid?
      expect(user.errors).to be_added(:description, :too_long, count: 240)
    end

  end

  # describe '関連性' do
  #   it "ユーザーが削除されるとユーザーの投稿も削除されること" do
  #     food = create(:food, user: user)
  #     expect(user.foods.count).to eq 1
  #     user.destroy
  #     expect(user.foods.count).to eq 0
  #   end
  # end
end
