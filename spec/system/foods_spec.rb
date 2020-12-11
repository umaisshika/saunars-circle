require 'rails_helper'

RSpec.describe '投稿機能', type: :system do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:admin_user) { create(:user, name: '管理ユーザー', admin: true) }
  let!(:food) { create(:food, user_id: user.id) }

  describe '投稿の新規作成' do
    before do
      login user
      visit new_food_path
    end

    context '有効な入力をしたとき' do
      it '投稿成功のメッセージが表示される' do
        attach_file 'food[image]', 'spec/factories/images/test.jpg'
        fill_in '品名', with: 'カレー'
        fill_in 'サウナ名', with: 'かるまる池袋'
        select '東京都', from: 'エリア'
        fill_in 'ひと言', with: 'スタンダードなカレー。サウナの後に食べると美味しい。'
        expect {
          click_button '送信'
          expect(page).to have_content('投稿しました')
        }.to change { Food.count }.by(1)
      end
    end

    context '無効な入力をしたとき' do
      it '投稿失敗のメッセージが表示されること' do
        click_button '送信'
        expect(page).to have_content('投稿に失敗しました')
      end
    end

    context 'ログインしていないとき' do
      it '投稿ボタンを押すとログイン画面に遷移すること' do
        logout
        visit new_food_path
        expect(page).to have_content('アカウント登録もしくはログインしてください。')
        expect(page).to have_content('ゲストユーザーでログイン')
      end
    end
  end

  describe '投稿詳細' do
    context '投稿したユーザーでログイン' do
      it '編集するボタン、削除するボタンが存在すること' do
        login user
        visit food_path(food.id)
        expect(page).to have_content(user.name)
        expect(page).to have_selector 'a', text: '編集する'
        expect(page).to have_selector 'a', text: '投稿を削除する'
      end

      context '投稿者でないユーザーでログイン' do
        it '編集するボタン、削除するボタンが存在しないこと' do
          login other_user
          visit food_path(food.id)
          expect(page).to have_content(user.name)
          expect(page).not_to have_selector 'a', text: '編集する'
          expect(page).not_to have_selector 'a', text: '投稿を削除する'
        end
      end

      context '管理ユーザーでログイン' do
        it '編集するボタンせず、削除するボタンが存在すること' do
          login admin_user
          visit food_path(food.id)
          expect(page).to have_content(user.name)
          expect(page).not_to have_selector 'a', text: '編集する'
          expect(page).to have_selector 'a', text: '投稿を削除する'
        end
      end

      context 'ログインしていない場合' do
        it '編集するボタン、削除するボタンが存在しないこと' do
          visit food_path(food.id)
          expect(page).to have_content(user.name)
          expect(page).not_to have_selector 'a', text: '編集する'
          expect(page).not_to have_selector 'a', text: '投稿を削除する'
        end
      end
    end
  end

  describe '投稿の編集' do
    before do
      login user
      visit edit_food_path(food.id)
    end

    context '有効な入力をしたとき' do
      it '成功のメッセージが表示されること' do
        fill_in '品名', with: 'イカ飯定食大盛り！！'
        click_button '送信'
        expect(page).to have_content('投稿を更新しました')
      end
    end
    context '無効な入力したとき' do
      it '失敗のメッセージが表示されること' do
        fill_in '品名', with: nil
        click_button '送信'
        expect(page).to have_content('編集出来ません。入力必須項目を確認してください')
      end
    end
    context 'ログインしていないとき' do
      it '投稿ボタンを押すとログイン画面に遷移すること' do
        logout
        visit edit_food_path(food.id)
        expect(page).to have_content('アカウント登録もしくはログインしてください。')
        expect(page).to have_content('ゲストユーザーでログイン')
      end
    end
  end

  describe '投稿の削除', js: true do
    context '投稿を削除できる' do
      it '成功のメッセージが表示されること' do
        login user
        visit food_path(food.id)
        expect {
          click_link '投稿を削除する'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content('投稿を削除しました')
        }.to change { Food.count }.by(-1)
      end

      it '管理ユーザーであれば投稿を削除できること' do
        login admin_user
        visit food_path(food.id)
        expect {
          click_link '投稿を削除する'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content('投稿を削除しました')
        }.to change { Food.count }.by(-1)
      end
    end

    context '投稿を削除できない' do
      it '投稿ユーザー及び管理ユーザー以外は削除ボタンが表示されないこと' do
        login other_user
        visit food_path(food.id)
        expect(page).to_not have_content('削除する')
      end
    end
  end
end
