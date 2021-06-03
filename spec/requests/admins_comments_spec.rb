require 'rails_helper'

RSpec.describe 'Admins_comments', type: :request do
  let!(:admin) { create(:admin) }
  let!(:food) { create(:food) }
  let!(:comment) { create(:comment, food_id: food.id) }

  describe 'DELETE admins/comments#destroy' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        sign_in admin
        delete admins_food_comment_path(id: comment.id, food_id: food.id), xhr: true
        expect(response).to have_http_status 200
      end

      it 'コメントを削除できること' do
        sign_in admin
        expect {
          delete admins_food_comment_path(id: comment.id, food_id: food.id), xhr: true
        }.to change(Comment, :count).by(-1)
      end
    end
  end
end
