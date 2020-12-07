require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do
  let!(:user) { create(:user) }
  let!(:food) { create(:food, user: user) }
  let!(:comment) { create(:comment, food: food, user: user) }

  describe 'コメントの新規作成' do
    it 'コメントできること', js: true do
      login user
      visit food_path(food.id)
      fill_in 'コメント欄', with: 'テストコメント'
      click_button 'コメントする'
      sleep 1
      expect(page).to have_content('テストコメント')
      expect(Comment.count).to eq 2
    end

    it 'コメントできないこと' do
      login user
      visit food_path(food.id)
      fill_in 'コメント欄', with: ''
      click_button 'コメントする'
      expect(page).to have_content('コメントに失敗しました')
    end

    it 'コメントボタンが表示されないこと' do
      visit food_path(food.id)
      expect(page).to_not have_content('コメントする')
    end
  end

  describe 'コメントの削除' do
    it 'コメント削除ができること', js: true do
      login user
      visit food_path(food.id)
      click_link 'コメント削除'
      expect(page).to_not have_content('コメントテスト')
      expect(Comment.count).to eq 0
    end
  end
end
