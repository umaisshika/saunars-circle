require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:food) { create(:food, user_id: user.id) }

  describe 'POST #create' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        comment_params = attributes_for(:comment, food: food, user: user)
        sign_in user
        post food_comments_path(food_id: food.id), xhr: true, params: { comment: comment_params }
        expect(response).to have_http_status 200
      end

      it 'コメントが登録できること' do
        comment_params = attributes_for(:comment, food: food, user: user)
        sign_in user
        expect {
          post food_comments_path(food_id: food.id), xhr: true, params: { comment: comment_params }
        }.to change(Comment, :count).by(1)
      end
    end

    context 'パラメータが無効' do
      it 'リクエストが成功すること' do
        comment_params = attributes_for(:comment, :invalid, food: food, user: user)
        sign_in user
        post food_comments_path(food_id: food.id), xhr: true, params: { comment: comment_params }
        expect(response).to have_http_status 200
      end

      it 'コメントが登録できないこと' do
        comment_params = attributes_for(:comment, :invalid, food: food, user: user)
        sign_in user
        expect {
          post food_comments_path(food_id: food.id), xhr: true, params: { comment: comment_params }
        }.to_not change(Comment, :count)
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトすること' do
        comment_params = attributes_for(:comment, food: food, user: user)
        post food_comments_path(food_id: food.id), xhr: true, params: { comment: comment_params }
        expect(response).to redirect_to new_user_session_path
      end

      it 'コメントが登録できないこと' do
        comment_params = attributes_for(:comment, food: food, user: user)
        expect {
          post food_comments_path(food_id: food.id), xhr: true, params: { comment: comment_params }
        }.to_not change(Comment, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:comment) { create(:comment, food_id: food.id, user_id: user.id) }

    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        sign_in user
        delete food_comment_path(id: comment.id, food_id: food.id), xhr: true
        expect(response).to have_http_status 200
      end

      it 'コメントを削除できること' do
        sign_in user
        expect {
          delete food_comment_path(id: comment.id, food_id: food.id), xhr: true
        }.to change(Comment, :count).by(-1)
      end
    end

    context 'オーナー権を持たないユーザー' do
      it 'リクエストが成功すること' do
        sign_in other_user
        delete food_comment_path(id: comment.id, food_id: food.id), xhr: true
        expect(response).to have_http_status 200
      end

      it 'コメントを削除できないこと' do
        sign_in other_user
        expect {
          delete food_comment_path(id: comment.id, food_id: food.id), xhr: true
        }.to_not change(Comment, :count)
      end
    end
  end
end
