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
      other_user.email = user.email
      other_user.valid?
      expect(other_user.errors).to be_added(:email, :taken, value: user.email)
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

    it '画像なしの場合、デフォルト画像が設定されること' do
      user.avatar = nil
      expect(user.avatar.url).to eq 'default_prof.png'
    end

    it '5MB以下の画像はアップロードできること' do
      user.avatar = File.open('spec/factories/images/test.jpg')
      expect(user).to be_valid
    end

    it '5MBを超える画像はアップロードできないこと' do
      user.avatar = File.open('spec/factories/images/5M_test.png')
      user.valid?
      expect(user.errors[:avatar]).to include 'を5MB以下のサイズにしてください'
    end
  end

  describe '関連性' do
    it 'ユーザーが削除されるとユーザーの投稿も削除されること' do
      food = create(:food, user: user)
      expect(user.foods.count).to eq 1
      user.destroy
      expect(user.foods.count).to eq 0
    end

    it 'ユーザーが削除されると、紐づくフォローも全て削除されること' do
      user.follow(other_user)
      expect(user.followings.count).to eq 1
      user.destroy
      expect(user.followings.count).to eq 0
    end

    it 'ユーザーが削除されると、紐づくフォロワーも全て削除されること' do
      other_user.follow(user)
      expect(user.followers.count).to eq 1
      user.destroy
      expect(user.followers.count).to eq 0
    end

    it 'ユーザーを削除すると関連する投稿のコメントも削除されること' do
      food = create(:food, user: user)
      comment = create(:comment, food: food, user: user)
      expect(user.comments.count).to eq 1
      user.destroy
      expect(user.comments.count).to eq 0
    end

    it 'ユーザーを削除すると関連する投稿のいいねも削除されること' do
      food = create(:food, user: user)
      like = create(:like, user: user, food: food)
      expect(user.likes.count).to eq 1
      user.destroy
      expect(user.likes.count).to eq 0
    end

    it 'フォロー後にユーザーを削除すると関連する通知も削除されること' do
      user.create_notification_follow!(other_user)
      expect(user.passive_notifications.count).to eq 1
      user.destroy
      expect(user.passive_notifications.count).to eq 0
    end

    it 'フォローされた後にユーザーを削除すると関連する通知も削除されること' do
      other_user.create_notification_follow!(user)
      expect(user.active_notifications.count).to eq 1
      user.destroy
      expect(user.active_notifications.count).to eq 0
    end
  end

  describe 'フォロー' do
    it 'ユーザーが他のユーザーをフォロー、フォロー解除可能である' do
      user.follow(other_user)
      expect(user.following?(other_user)).to eq true
      user.unfollow(other_user)
      expect(user.following?(other_user)).to eq false
    end

    it 'フォローしているユーザーの投稿はお気に入りの投稿に表示されること' do
      food = create(:food, user: other_user)
      user.follow(other_user)
      other_user.foods.each do |food_following|
        expect(user.feed).to include(food_following)
      end
    end

    it 'フォローしていないユーザーの投稿はフィードに表示されないこと' do
      food = create(:food, user: other_user)
      expect(user.following?(other_user)).to eq false
      other_user.foods.each do |food_following|
        expect(user.feed).not_to include(food_following)
      end
    end
  end

  describe '通知' do
    it '初回フォローで通知が作成されること' do
      expect { user.create_notification_follow!(other_user) }.to change(user.passive_notifications, :count).by(1)
    end

    it '過去にフォローしたことがある場合、通知は作成されないこと' do
      user.create_notification_follow!(other_user)
      expect { user.create_notification_follow!(other_user) }.to change(user.passive_notifications, :count).by(0)
    end
  end
end
