require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  let!(:user) { create(:user) }
  let!(:food) { create(:food, user: user) }

  describe 'GET #index' do
    it 'リクエストが成功すること' do
      get '/foods'
      expect(response).to have_http_status 200
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      sign_in user
      get new_food_path
      expect(response).to have_http_status 200
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        get new_food_path
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #show' do
    it 'リクエストが成功すること' do
      sign_in user
      get food_path(food)
      expect(response).to have_http_status 200
    end
  end

  describe 'POST #create' do
    context 'パラメータが有効なとき' do
      it 'リクエストが成功すること' do
        sign_in user
        food_params = attributes_for(:food)
        post foods_path, params: { food: food_params }
        expect(response.status).to eq 302
        expect(response).to redirect_to foods_path
      end

      it '投稿が登録されること' do
        sign_in user
        food_params = attributes_for(:food)
        expect {
          post foods_path, params: { food: food_params }
        }.to change { Food.count }.by(1)
      end
    end

    context 'パラメータが無効なとき' do
      it 'リクエストが成功すること' do
        sign_in user
        food_params = attributes_for(:food, :invalid)
        post foods_path, params: { food: food_params }
        expect(response.status).to eq 200
      end

      it '投稿が登録されないこと' do
        sign_in user
        food_params = attributes_for(:food, :invalid)
        expect {
          post foods_path, params: { food: food_params }
          expect(response.body).to include '投稿に失敗しました'
        }.to_not change(Food, :count)
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        food_params = attributes_for(:food, user: user)
        post foods_path, params: { food: food_params }
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        sign_in user
        delete food_path(food)
        expect(response).to have_http_status 302
      end

      it '投稿が削除されること' do
        sign_in user
        expect {
          delete food_path(food)
        }.to change { Food.count }.by(-1)
        expect(response).to redirect_to foods_path
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        delete food_path(food)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #edit' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        sign_in user
        get edit_food_path(food)
        expect(response.status).to eq 200
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        get edit_food_path(food)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PUT #update' do
    context 'パラメータが有効なとき' do
      it 'リクエストが成功すること' do
        sign_in user
        food_params = attributes_for(:food, name: '更新テスト')
        put food_path(food), params: { food: food_params }
        expect(response.status).to eq 302
      end

      it '投稿が更新されること' do
        sign_in user
        food_params = attributes_for(:food, name: '更新テスト')
        expect {
          put food_path(food), params: { food: food_params }
        }.to change { Food.find(food.id).name }.from('カレーライス').to('更新テスト')
      end
    end

    context 'パラメータが無効なとき' do
      it 'リクエストが成功すること' do
        sign_in user
        food_params = attributes_for(:food, :invalid)
        put food_path(food), params: { food: food_params }
        expect(response.status).to eq 200
      end

      it '投稿が更新されないこと' do
        sign_in user
        food_params = attributes_for(:food, :invalid)
        expect {
          put food_path(food), params: { food: food_params }
        }.to_not change(Food.find(food.id), :name)
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        food_params = FactoryBot.attributes_for(:food, user: user)
        put food_path(food), params: { food: food_params }
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
