require 'rails_helper'

RSpec.describe 'いいね機能', type: :system, js: true do
  let!(:user) { create(:user) }
  let!(:food) { create(:food, user: user) }

  describe 'ユーザーが投稿をいいね、いいね解除できる' do
    before do
      login user
      visit food_path(food.id)
    end

    it '投稿をいいねして解除できる' do
      expect {
        find('.like-btn').click
        expect(page).to have_selector '.liked-btn'
      }.to change { food.likes.count }.by(1)
      expect {
        find('.liked-btn').click
        expect(page).to have_selector '.like-btn'
      }.to change { food.likes.count }.by(-1)
    end
  end

  describe 'いいねした投稿の表示' do
    before do
      login user
      visit food_path(food.id)
      expect {
        find('.like-btn').click
        expect(page).to have_selector '.liked-btn'
      }.to change { food.likes.count }.by(1)
    end

    it '投稿をいいねするといいねした投稿に表示されること' do
      visit like_foods_user_path(user)
      expect(page).to have_selector 'h2', text: 'いいねした投稿'
      expect(page).to have_selector("img[src$='test.jpg']")
      expect(page).to have_content('カレーライス')
      expect(page).to have_content('かるまる')
    end

    it '投稿をいいね解除するといいねした投稿から削除されること' do
      expect {
        find('.liked-btn').click
        expect(page).to have_selector '.like-btn'
      }.to change { food.likes.count }.by(-1)
      visit like_foods_user_path(user)
      expect(page).to have_selector 'h2', text: 'いいねした投稿'
      expect(page).not_to have_selector("img[src$='test.jpg']")
      expect(page).not_to have_content('カレーライス')
      expect(page).not_to have_content('かるまる')
    end
  end
end
