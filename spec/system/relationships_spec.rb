require 'rails_helper'

RSpec.describe 'ユーザーフォロー機能', type: :system do
  let!(:user) { create(:user, name: '一般ユーザー') }
  let!(:other_user) { create(:user, name: 'その他ユーザー') }

  describe '他のユーザーをフォローしていない場合' do
    it 'フォローできること', js: true do
      login user
      visit user_path(other_user)
      expect {
        click_on 'お気に入り'
        expect(page).to have_button 'お気に入り済み'
      }.to change { other_user.followers.count }.by(1)
    end

    it 'フォロワー一覧を表示してる状態でフォロワーが追加されること', js: true do
      login user
      visit followers_user_path(other_user)
      expect {
        click_on 'お気に入り'
        expect(page).to have_button 'お気に入り済み'
        expect(page).to have_content user.name
      }.to change { other_user.followers.count }.by(1)
    end
  end

  describe '他のユーザーをフォローしている場合' do
    let!(:relationship) { create(:relationship, user_id: user.id, follow_id: other_user.id) }

    it 'ユーザーのフォロー状況が表示されていること' do
      visit followings_user_path(user)
      expect(page).to have_content other_user.name
    end

    it 'ユーザーのフォロワーが表示されていること' do
      visit followers_user_path(other_user)
      expect(page).to have_content user.name
    end

    it 'フォロー解除できること', js: true do
      login user
      visit user_path(other_user)
      expect {
        click_on 'お気に入り済み'
        expect(page).to have_button 'お気に入り'
      }.to change { other_user.followers.count }.by(-1)
    end

    it 'フォロワー一覧を表示してる状態でフォロワーが削除されること', js: true do
      login user
      visit followers_user_path(other_user)
      expect(page).to have_content user.name
      expect {
        click_on 'お気に入り済み'
        expect(page).to_not have_content user.name
      }.to change { other_user.followers.count }.by(-1)
    end
  end
end
