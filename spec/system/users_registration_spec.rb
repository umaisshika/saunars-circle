require 'rails_helper'

RSpec.describe 'ユーザー登録', type: :system do

  describe '登録成功' do
    before do
      visit new_user_registration_path
      fill_in 'user[name]', with: 'テストユーザー'
      fill_in 'user[email]', with: 'tester@example.com'
      fill_in 'user[password]', with: 'password123'
      fill_in 'user[password_confirmation]', with: 'password123'
      click_button '登録する'
    end
  end
end
