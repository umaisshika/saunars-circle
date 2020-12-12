require 'rails_helper'

RSpec.describe '通知機能', type: :system, js: true do
  let!(:user) { create(:user, name: '一般ユーザー') }
  let!(:other_user) { create(:user, name: 'その他ユーザー') }
  let!(:food) { create(:food, user: user) }

  describe '通知成功' do
    it 'フォローされたことが通知されること' do
      login other_user
      visit user_path(user)
      expect {
        click_on 'お気に入り'
        sleep 1
        expect(page).to have_button 'お気に入り済み'
      }.to change { user.passive_notifications.count }.by(1)
      logout
      login user
      expect {
        visit notifications_path
        expect(page).to have_content('その他ユーザー')
        expect(page).to have_content('あなたをフォローしました')
      }.to change { user.passive_notifications.where(checked: true).count }.by(1)
    end

    it 'いいねされたことが通知されること' do
      login other_user
      visit food_path(food.id)
      expect {
        find('.like-btn').click
        expect(page).to have_selector '.liked-btn'
      }.to change { user.passive_notifications.count }.by(1)
      logout
      login user
      expect {
        visit notifications_path
        expect(page).to have_content('その他ユーザー')
        expect(page).to have_content('あなたの投稿')
        expect(page).to have_content('にいいねしました')
      }.to change { user.passive_notifications.where(checked: true).count }.by(1)
    end

    it 'コメントされたことが通知されること' do
      login other_user
      visit food_path(food.id)
      fill_in 'コメント欄', with: 'テストコメント'
      expect {
        click_button 'コメントする'
        expect(page).to have_content('テストコメント')
      }.to change { user.passive_notifications.count }.by(1)
      logout
      login user
      expect {
      visit notifications_path
        expect(page).to have_content('その他ユーザー')
        expect(page).to have_content('あなたの投稿')
        expect(page).to have_content('にコメントしました')
        expect(page).to have_content('テストコメント')
    }.to change { user.passive_notifications.where(checked: true).count }.by(1)
    end

    it '2回コメントしてコメントされたことが2回通知されること' do
      login other_user
      visit food_path(food.id)
      fill_in 'コメント欄', with: 'テストコメント1'
      expect {
        click_button 'コメントする'
        expect(page).to have_content('テストコメント1')
      }.to change { user.passive_notifications.count }.by(1)
      fill_in 'コメント欄', with: 'テストコメント2'
      expect {
        click_button 'コメントする'
        expect(page).to have_content('テストコメント2')
      }.to change { user.passive_notifications.count }.by(1)
      logout
      login user
      expect {
        visit notifications_path
        expect(page).to have_content('その他ユーザー')
        expect(page).to have_content('あなたの投稿')
        expect(page).to have_content('にコメントしました')
        expect(page).to have_content('テストコメント1')
        expect(page).to have_content('テストコメント2')
      }.to change { user.passive_notifications.where(checked: true).count }.by(2)
    end
  end

  describe '通知失敗' do
    it '自分でいいねしたことが通知されないこと' do
      login user
      visit food_path(food.id)
      expect {
        find('.like-btn').click
        expect(page).to have_selector '.liked-btn'
      }.to change { user.passive_notifications.count }.by(0)
      visit notifications_path
      expect(page).to have_content('通知はありません')
    end

    it '自分でコメントしたことが通知されないこと' do
      login user
      visit food_path(food.id)
      fill_in 'コメント欄', with: 'テストコメント'
      expect {
        click_button 'コメントする'
        expect(page).to have_content('テストコメント')
      }.to change { user.passive_notifications.count }.by(0)
      visit notifications_path
      expect(page).to have_content('通知はありません')
    end
  end

  describe 'アイコン' do
    it '通知がある場合、通知有りのアイコンになっている' do
      login other_user
      visit user_path(user)
      click_on 'お気に入り'
      logout
      login user
      # 通知ありアイコンが存在する
      expect(page).to have_selector '.fa-bell'
      expect(page).to have_selector '.n-circle'
    end

    it '通知がない場合、通知なしのアイコンになっている' do
      expect(Notification.count).to eq 0
      login user
      # 通知なしアイコンが存在する
      expect(page).to have_selector '.fa-bell'
      expect(page).to_not have_selector '.n-circle'
    end
  end

  describe 'ログインしていない場合' do
    it 'トップページで通知アイコンが表示されない' do
      visit root_path
      expect(page).to_not have_selector '.fa-bell'
    end

    it 'URL直打ちで通知一覧を表示しようとするとログイン画面に遷移する' do
      visit notifications_path
      expect(page).to have_content('アカウント登録もしくはログインしてください。')
      expect(page).to have_content('ゲストユーザーでログイン')
    end
  end
end
