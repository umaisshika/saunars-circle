require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:food) { create(:food, user_id: user.id) }

  describe 'POST #create' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        sign_in user
        post likes_path(food_id: food.id), xhr: true
        expect(response).to have_http_status 200
      end

      it 'いいねできること' do
        sign_in user
        expect {
          post likes_path(food_id: food.id), xhr: true
        }.to change(Like, :count).by(1)
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        post likes_path(food_id: food.id), xhr: true
        expect(response).to have_http_status 200
        expect(response).to redirect_to new_user_session_path
      end

      it 'いいねできないこと' do
        expect {
          post likes_path(food_id: food.id), xhr: true
        }.to_not change(Like, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:like) { create(:like, food_id: food.id, user_id: user.id) }

    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        sign_in user
        delete like_path(id: like.id, food_id: food.id), xhr: true
        expect(response).to have_http_status 200
      end

      it 'いいね解除できること' do
        sign_in user
        expect {
          delete like_path(id: like.id, food_id: food.id), xhr: true
        }.to change(Like, :count).by(-1)
      end
    end

    context 'オーナー権を持たないユーザー' do
      it 'トップページにリダイレクトされること' do
        sign_in other_user
        delete like_path(id: like.id, food_id: food.id), xhr: true
        expect(response).to have_http_status 200
        expect(response).to redirect_to root_path
      end

      it 'いいね解除できないこと' do
        sign_in other_user
        expect {
          delete like_path(id: like.id, food_id: food.id), xhr: true
        }.to_not change(Like, :count)
      end
    end

    context '未ログイン状態のとき' do
      it 'トップページにリダイレクトされること' do
        delete like_path(id: like.id, food_id: food.id), xhr: true
        expect(response).to have_http_status 200
        expect(response).to redirect_to new_user_session_path
      end

      it 'いいね解除できないこと' do
        expect {
          delete like_path(id: like.id, food_id: food.id), xhr: true
        }.to_not change(Like, :count)
      end
    end
  end
end
