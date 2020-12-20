require 'rails_helper'

RSpec.describe Notification, type: :model do
  let!(:notification) { create(:notification) }

  describe '#create' do
    it 'いいねされた時に保存されること' do
      notification.action = 'like'
      expect(notification).to be_valid
    end

    it 'フォローされた時に保存されること' do
      notification.action = 'follow'
      expect(notification).to be_valid
    end

    it 'コメントされた時に保存されること' do
      notification.action = 'comment'
      expect(notification).to be_valid
    end

    it 'actionが空の場合は保存されないこと' do
      notification.action = nil
      notification.valid?
      expect(notification.errors).to be_added(:action, :blank)
    end

    it '通知の送信者が空の場合は保存されないこと' do
      notification.visitor = nil
      notification.valid?
      expect(notification.errors).to be_added(:visitor, :blank)
    end

    it '通知の受信者が空の場合は保存されないこと' do
      notification.visited = nil
      notification.valid?
      expect(notification.errors).to be_added(:visited, :blank)
    end
  end
end
