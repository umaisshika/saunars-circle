require 'rails_helper'

RSpec.describe 'ユーザー登録', type: :system do
  let!(:user) { create(:user, name: '一般ユーザー') }
  let!(:other_user) { create(:user, name: 'その他ユーザー') }
  let!(:admin_user) { create(:user, name: '管理ユーザー', admin: true) }

  describe '編集機能' do
    it 'プロフィールを編集出来ること' do
      login user
      visit edit_user_path(user)
      attach_file 'user[avatar]', 'spec/factories/images/test.jpg'
      fill_in '自己紹介', with: '毎週水曜は欠かさずホームサウナに通ってます'
      click_on '更新する'
      expect(page).to have_content 'アカウント情報を変更しました。'
    end
  end

  describe '詳細表示機能' do
    it 'ログイン状態に関わらずユーザーが表示されること' do
      visit user_path(user)
      expect(page).to have_content user.name
    end
  end

  describe '削除機能', js: true do
    it '管理者はユーザーを削除できること' do
      login(admin_user)
      visit user_path(user)
      expect {
        click_on '削除する'
        page.accept_confirm '削除しますか？'
        expect(page).to have_content '「一般ユーザー」は正常に削除されました'
      }.to change { User.count }.by(-1)
    end

    it '管理者権限のないユーザーはユーザーを削除リンクが表示されないこと' do
      login(user)
      visit user_path(user)
      expect(page).not_to have_content '削除する'
    end
  end
end