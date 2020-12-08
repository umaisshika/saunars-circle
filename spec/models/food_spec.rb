require 'rails_helper'

RSpec.describe Food, type: :model do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:food) { create(:food, user: user) }
  let!(:comment) { create(:comment, food: food, user: user) }

  describe '#create' do
    it '有効なファクトリを持つこと' do
      expect(food).to be_valid
    end

    it 'エリアがないため無効であること' do
      food.prefecture_id = nil
      food.valid?
      expect(food.errors).to be_added(:prefecture_id, :blank)
    end

    it '画像がないため無効であること' do
      food.image = nil
      food.valid?
      expect(food.errors).to be_added(:image, :blank)
    end

    it '5MBを超える画像はアップロードできないこと' do
      food.image = File.open('spec/factories/images/5M_test.png')
      food.valid?
      expect(food.errors[:image]).to include 'を5MB以下のサイズにしてください'
    end

    it '品名がないため無効であること' do
      food.name = nil
      food.valid?
      expect(food.errors).to be_added(:name, :blank)
    end

    it '品名が21文字以上で無効であること' do
      food.name = 'a' * 21
      food.valid?
      expect(food.errors).to be_added(:name, :too_long, count: 20)
    end

    it '品名が20文字以内であれば有効にであること' do
      food.name = 'a' * 20
      expect(food).to be_valid
    end

    it 'ひとことが201文字以上で無効であること' do
      food.description = 'a' * 201
      food.valid?
      expect(food.errors).to be_added(:description, :too_long, count: 200)
    end

    it 'ひとことが200文字以内で有効にであること' do
      food.description = 'a' * 200
      expect(food).to be_valid
    end

    it 'サウナが21文字以上で無効であること' do
      food.visited_sauna = 'a' * 21
      food.valid?
      expect(food.errors).to be_added(:visited_sauna, :too_long, count: 20)
    end

    it 'サウナが20文字以上で有効にであること' do
      food.visited_sauna = 'a' * 20
      expect(food).to be_valid
    end
  end

  describe '関連性' do
    it '投稿を削除すると紐づくいいねも削除されること' do
      like = create(:like, user: user, food: food)
      expect(user.likes.count).to eq 1
      food.destroy
      expect(user.likes.count).to eq 0
    end

    it '投稿を削除すると紐づくコメントも削除されること' do
      expect(user.comments.count).to eq 1
      food.destroy
      expect(user.comments.count).to eq 0
    end

    it '投稿を削除すると紐づく通知も削除されること' do
      food.create_notification_like!(other_user)
      food.create_notification_comment!(other_user, comment.id)
      expect(Notification.count).to eq 2
      food.destroy
      expect(Notification.count).to eq 0
    end
  end

  describe '通知' do
    it '投稿にいいねしたら通知が作成されること' do
      expect { food.create_notification_like!(other_user) }.to change(user.passive_notifications, :count).by(1)
    end

    it '自分の投稿にいいねしたら通知が作成されないこと' do
      expect { food.create_notification_like!(user) }.to change(user.passive_notifications, :count).by(0)
    end

    it '過去にいいねしていたら通知が作成されないこと' do
      food.create_notification_like!(user)
      expect { food.create_notification_like!(user) }.to change(user.passive_notifications, :count).by(0)
    end

    it '投稿にコメントしたら通知が作成されること' do
      expect { food.create_notification_comment!(other_user, comment.id) }.to change(user.passive_notifications, :count).by(1)
    end

    it '自分の投稿にコメントしても通知が作成されないこと' do
      expect { food.create_notification_comment!(user, comment.id) }.to change(user.passive_notifications, :count).by(0)
    end

    it '投稿にコメントした回数分の通知が作成されること' do
      food.create_notification_comment!(other_user, comment.id)
      food.create_notification_comment!(other_user, comment.id)
      expect(user.passive_notifications.count).to eq 2
    end
  end
end
