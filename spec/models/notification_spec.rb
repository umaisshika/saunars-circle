require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe '#create' do
    context "保存できること" do
      it "いいねされた時に保存されること" do
        notification = build(:notification, action: "like")
        expect(notification).to be_valid
      end

      it "フォローされた時に保存されること" do
        notification = build(:notification, action: "follow")
        expect(notification).to be_valid
      end

      it "コメントされた時に保存されること" do
        notification = build(:notification, action: "comment")
        expect(notification).to be_valid
      end
    end

    context "保存できないこと" do
      it "actionが空の場合は保存されないこと" do
        notification = build(:notification, action: "")
        notification.valid?
        expect(notification).not_to be_valid
      end

      it "通知の送信者が空の場合は保存されないこと" do
        notification = build(:notification, visitor: nil)
        notification.valid?
        expect(notification).not_to be_valid
      end

      it "通知の受信者が空の場合は保存されないこと" do
        notification = build(:notification, visited: nil)
        notification.valid?
        expect(notification).not_to be_valid
      end
    end
  end
end
