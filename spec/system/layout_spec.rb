require 'rails_helper'

RSpec.describe 'レイアウト', type: :system do
  let!(:user) { create(:user) }
  let!(:food) { create(:food, user: user) }

  describe 'ヘッダー' do
    it 'ログインしていない場合' do
      visit root_path
      expect(page).to have_selector 'a', text: '投稿一覧'
      expect(page).to have_selector 'a', text: 'ユーザー一覧'
      expect(page).to have_selector 'a', text: 'ログイン'
      expect(page).to have_selector 'a', text: '新規登録'
      expect(page).not_to have_selector '.fa-bell'
      expect(page).not_to have_selector 'a', text: 'ログアウト'
      expect(page).not_to have_selector '.img-circle'
    end

    it 'ログインしている場合' do
      login user
      expect(page).to have_selector 'a', text: '投稿一覧'
      expect(page).to have_selector 'a', text: 'ユーザー一覧'
      expect(page).to have_selector '.fa-bell'
      expect(page).to have_selector 'a', text: 'ログアウト'
      expect(page).to have_selector '.img-circle'
      expect(page).not_to have_selector 'a', text: 'ログイン'
      expect(page).not_to have_selector 'a', text: '新規登録'
    end
  end

  describe 'ホーム画面' do
    it 'ログインしていない場合' do
      visit root_path
      expect(page).to have_selector 'h1', text: 'サウナ飯を楽しもう'
      expect(page).to have_selector 'a', text: '新規登録'
      expect(page).to have_selector 'a', text: 'ログイン'
      expect(page).to have_selector 'a', text: 'ゲストログイン'
      expect(page).not_to have_selector 'h2', text: '投稿一覧'
    end

    it 'ログインしている場合' do
      login user
      expect(page).to have_selector 'h2', text: '投稿一覧'
      expect(page).to have_selector '.search'
      expect(page).to have_selector 'a', text: 'みんなのサ飯'
      expect(page).to have_selector 'a', text: 'お気に入りのサ飯'
      expect(page).to have_selector '.cards'
      expect(page).not_to have_selector 'h1', text: 'サウナ飯を楽しもう'
    end
  end
end
