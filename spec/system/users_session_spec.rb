require 'rails_helper'

RSpec.describe 'セッション管理', type: :system do
  let!(:user) { FactoryBot.create :user }

  describe 'ログイン成功' do
		it 'ログインできること' do
			login(user)
      expect(page).to have_content 'ログインしました。'
      logout
      expect(page).to have_content 'ログアウトしました。'
    end
    
    it '簡単ログインができること' do
      visit new_user_session_path
      click_link 'ゲストユーザーでログイン'
      expect(page).to have_content 'ゲストユーザーとしてログインしました。'
      logout
      expect(page).to have_content 'ログアウトしました。'
    end
	end

  describe 'ログイン失敗' do
    it 'メールアドレスが無効である' do
      visit new_user_session_path
      fill_in 'Eメール', with: 'error@example'
      fill_in 'パスワード', with: user.password
      click_button 'ログイン'
      expect(page).to have_content 'Eメールまたはパスワードが違います。'
    end
    
    it 'パスワードが無効である' do
      visit new_user_session_path
      fill_in 'Eメール', with: user.email
      fill_in 'パスワード', with: 'errorpassword'
      click_button 'ログイン'
      expect(page).to have_content 'Eメールまたはパスワードが違います。'
    end
	end
end