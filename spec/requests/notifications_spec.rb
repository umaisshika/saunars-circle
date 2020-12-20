require 'rails_helper'

RSpec.describe 'Notifications', type: :request do
  let!(:user) { create(:user) }

  describe 'GET #index' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        sign_in user
        get notifications_path
        expect(response).to have_http_status '200'
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページへリダイレクトすること' do
        get notifications_path
        expect(response).to redirect_to new_user_session_path
        expect(response).to have_http_status '302'
      end
    end
  end
end
