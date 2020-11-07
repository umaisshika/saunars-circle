require 'rails_helper'

RSpec.describe 'ユーザーフォロー機能', type: :system do
  let!(:user) { FactoryBot.create(:user, name: '一般ユーザー') }
  let!(:other_user) { FactoryBot.create(:user, name: 'その他ユーザー') }

  describe '他のユーザーをフォローしていない場合' do
    it 'フォローできること' , js: true do
      login user
      visit user_path(other_user)
      expect(other_user.followers.count).to eq(0)
      click_on 'お気に入り'
      sleep 1
      expect(page).to have_button 'お気に入り済み'
      expect(other_user.followers.count).to eq(1)
    end

    it 'フォロワー一覧を表示してる状態でフォロワーが追加されること' , js: true do
      login user
      visit followers_user_path(other_user)
      click_on 'お気に入り'
      expect(page).to have_button 'お気に入り済み'
      expect(page).to have_content user.name
    end
  end

  describe '他のユーザーをフォローしている場合' do
    let!(:relationship) {FactoryBot.create(:relationship, user_id: user.id, follow_id: other_user.id)}

    it 'ユーザーのフォロー状況が表示されていること' do
      visit followings_user_path(user)
      expect(page).to have_content other_user.name
    end

    it 'ユーザーの非フォロー状況が表示されていること' do
      visit followers_user_path(other_user)
      expect(page).to have_content user.name
    end

    it 'フォロー解除できること' , js: true do
      login user
      visit user_path(other_user)
      expect(other_user.followers.count).to eq(1)
      click_on 'お気に入り済み'
      expect(page).to have_button 'お気に入り'
      expect(other_user.followers.count).to eq(0)
    end

    it 'フォロワー一覧を表示してる状態でフォロワーが削除されること' , js: true do
      login user
      visit followers_user_path(other_user)
      expect(page).to have_content user.name
      click_on 'お気に入り済み'
      expect(page).to_not have_content user.name
    end
  end
end