require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  let!(:user) { create(:user) }
  let!(:admin) { create(:admin) }
  let!(:food) { create(:food, user: user) }

  describe 'GET #index' do
    it 'リクエストが成功すること' do
      sign_in admin
      get admins_foods_path
      expect(response).to have_http_status 200
    end
  end

  describe 'GET #show' do
    it 'リクエストが成功すること' do
      sign_in admin
      get admins_food_path(food)
      expect(response).to have_http_status 200
    end
  end

  describe 'DELETE #destroy' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        sign_in admin
        delete admins_food_path(food)
        expect(response).to have_http_status 302
      end

      it '投稿が削除されること' do
        sign_in admin
        expect {
          delete admins_food_path(food)
        }.to change { Food.count }.by(-1)
        expect(response).to redirect_to admins_foods_path
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        delete admins_food_path(food)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe 'GET #edit' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        sign_in admin
        get edit_admins_food_path(food)
        expect(response.status).to eq 200
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        get edit_admins_food_path(food)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe 'PUT #update' do
    context 'パラメータが有効なとき' do
      it 'リクエストが成功すること' do
        sign_in admin
        food_params = attributes_for(:food, name: '更新テスト')
        put admins_food_path(food), params: { food: food_params }
        expect(response.status).to eq 302
      end

      it '投稿が更新されること' do
        sign_in admin
        food_params = attributes_for(:food, name: '更新テスト')
        expect {
          put admins_food_path(food), params: { food: food_params }
        }.to change { Food.find(food.id).name }.from('カレーライス').to('更新テスト')
      end
    end

    context 'パラメータが無効なとき' do
      it 'リクエストが成功すること' do
        sign_in admin
        food_params = attributes_for(:food, :invalid)
        put admins_food_path(food), params: { food: food_params }
        expect(response.status).to eq 200
      end

      it '投稿が更新されないこと' do
        sign_in user
        food_params = attributes_for(:food, :invalid)
        expect {
          put admins_food_path(food), params: { food: food_params }
        }.to_not change(Food.find(food.id), :name)
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        food_params = FactoryBot.attributes_for(:food, user: user)
        put admins_food_path(food), params: { food: food_params }
        expect(response.status).to eq 302
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end
end
