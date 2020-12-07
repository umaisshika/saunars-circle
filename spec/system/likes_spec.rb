require 'rails_helper'

RSpec.describe 'いいね機能', type: :system do
  let!(:user) { create(:user) }
  let!(:food) { create(:food, user: user) }

  describe 'ユーザーが投稿をいいね、いいね解除できる' do
    before do
      login user
      visit food_path(food.id)
    end
    it '投稿をいいねして解除できる', js: true do
      find('.like-btn').click
      expect(page).to have_selector '.liked-btn'
      expect(food.likes.count).to eq(1)
      find('.liked-btn').click
      expect(page).to have_selector '.like-btn'
      expect(food.likes.count).to eq(0)
    end
  end
end
