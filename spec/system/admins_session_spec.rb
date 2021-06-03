require 'rails_helper'

RSpec.describe 'セッション管理', type: :system do
  let!(:admin) { create(:admin) }

  describe 'ログイン成功' do
    it 'ログインできること' do
      login_admin(admin)
      expect(page).to have_content 'ログインしました。'
      logout
      expect(page).to have_content 'ログアウトしました。'
    end
  end

  describe 'ログイン失敗' do
    it 'メールアドレスが無効である' do
      visit new_admin_session_path
      fill_in 'admin_email', with: 'error@example'
      fill_in 'admin_password', with: admin.password
      click_button 'ログイン'
      expect(page).to have_content 'Emailまたはパスワードが違います。'
    end

    it 'パスワードが無効である' do
      visit new_admin_session_path
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: 'errorpassword'
      click_button 'ログイン'
      expect(page).to have_content 'Emailまたはパスワードが違います。'
    end
  end
end