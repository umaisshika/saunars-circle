require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }
  # let!(:admin_user) { create(:user, admin: true) }
  let!(:guest_user) { create(:user, email: 'guest@example.com') }

  describe 'GET #index' do
    it 'リクエストが成功すること' do
      get users_path
      expect(response).to have_http_status 200
    end
  end

  describe 'GET #new' do
    context 'ログイン状態のとき' do
      it 'トップページにリダイレクトされること' do
        sign_in user
        get new_user_registration_path
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
      end
    end

    context '未ログイン状態のとき' do
      it 'リクエストが成功すること' do
        get new_user_registration_path
        expect(response).to have_http_status 200
      end
    end
  end

  describe 'GET #show' do
    it 'リクエストが成功すること' do
      sign_in user
      get user_path(user)
      expect(response).to have_http_status 200
    end
  end

  describe 'POST #create' do
    context 'パラメータが有効な場合' do
      it 'リクエストが成功すること' do
        user_params = attributes_for(:user)
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
      end

      it 'ユーザーを登録できること' do
        user_params = FactoryBot.attributes_for(:user)
        expect {
          post user_registration_path, params: { user: user_params }
        }.to change(User, :count).by(1)
      end
    end

    context 'パラメータが無効な場合' do
      it 'リクエストが成功すること' do
        user_params = FactoryBot.attributes_for(:user, name: nil)
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 200
      end

      it 'ユーザーを登録できないこと' do
        user_params = FactoryBot.attributes_for(:user, name: nil)
        expect {
          post user_registration_path, params: { user: user_params }
        }.to_not change(User, :count)
      end
    end
  end

  describe 'GET #edit' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        sign_in user
        get edit_user_path(user)
        expect(response.status).to eq 200
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        get edit_user_path(user)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PUT #update' do
    context 'パラメータが有効なとき' do
      it 'リクエストが成功すること' do
        sign_in user
        user_params = attributes_for(:user)
        put user_path(user), params: { user: user_params }
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
      end

      it '更新できること' do
        sign_in user
        user_params = attributes_for(:user, name: '更新テスト')
        put user_path(user), params: { user: user_params }
        expect(user.reload.name).to eq '更新テスト'
      end
    end

    context 'パラメータが無効なとき' do
      it 'リクエストが成功すること' do
        sign_in user
        user_params = attributes_for(:user, name: nil)
        put user_path(user), params: { user: user_params }
        expect(response.status).to eq 200
      end

      it '更新されないこと' do
        sign_in user
        user_params = attributes_for(:user, name: nil)
        expect {
          put user_path(user), params: { user: user_params }
        }.to_not change(User.find(user.id), :name)
      end
    end

    context 'ゲストユーザーでログインのとき' do
      it '更新されずログインページにリダイレクトされること' do
        sign_in guest_user
        user_params = attributes_for(:user)
        expect {
          put user_path(guest_user), params: { user: user_params }
        }.to_not change(User.find(user.id), :name)
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
      end
    end

    context '未ログインのとき' do
      it '更新されずログインページにリダイレクトされること' do
        user_params = attributes_for(:user)
        expect {
          put user_path(user), params: { user: user_params }
        }.to_not change(User.find(user.id), :name)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  # describe 'DELETE #destroy' do
  #   context '管理ユーザーでログイン' do
  #     it 'リクエストが成功すること' do
  #       sign_in admin_user
  #       delete user_path(user)
  #       expect(response.status).to eq 302
  #       expect(response).to redirect_to root_path
  #     end

  #     it 'ユーザーが削除されること' do
  #       sign_in admin_user
  #       expect {
  #         delete user_path(user)
  #       }.to change(User, :count).by(-1)
  #     end
  #   end

  #   context '一般ユーザーでログイン' do
  #     it 'トップページにリダイレクトされること' do
  #       sign_in user
  #       delete user_path(user)
  #       expect(response.status).to eq 302
  #       expect(response).to redirect_to root_path
  #     end

  #     it 'ユーザーが削除されないこと' do
  #       sign_in user
  #       expect {
  #         delete user_path(user)
  #       }.to_not change(User, :count)
  #     end
  #   end

  #   context '未ログイン状態' do
  #     it 'ログインページにリダイレクトされること' do
  #       delete user_path(user)
  #       expect(response.status).to eq 302
  #       expect(response).to redirect_to new_user_session_path
  #     end

  #     it 'ユーザーが削除されないこと' do
  #       expect {
  #         delete user_path(user)
  #       }.to_not change(User, :count)
  #     end
  #   end
  # end

  # describe 'GET #followings' do
  #   it 'リクエストが成功すること' do
  #     get followings_user_path(user)
  #     expect(response).to have_http_status 200
  #   end
  # end

  # describe 'GET #followers' do
  #   it 'リクエストが成功すること' do
  #     get followers_user_path(user)
  #     expect(response).to have_http_status 200
  #   end
  # end

  # describe 'GET #like_foods' do
  #   it 'リクエストが成功すること' do
  #     get like_foods_user_path(user)
  #     expect(response).to have_http_status 200
  #   end
  # end
end
