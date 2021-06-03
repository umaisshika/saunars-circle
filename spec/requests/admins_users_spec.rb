require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }
  let!(:admin) { create(:admin) }

  describe 'GET #index' do
    it 'リクエストが成功すること' do
      sign_in admin
      get admins_users_path
      expect(response).to have_http_status 200
    end
  end

  describe 'GET #show' do
    it 'リクエストが成功すること' do
      sign_in admin
      get admins_user_path(user)
      expect(response).to have_http_status 200
    end
  end

  describe 'GET #edit' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        sign_in admin
        get edit_admins_user_path(user)
        expect(response.status).to eq 200
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        get edit_admins_user_path(user)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe 'PUT #update' do
    context 'パラメータが有効なとき' do
      it 'リクエストが成功すること' do
        sign_in admin
        user_params = attributes_for(:user)
        put admins_user_path(user), params: { user: user_params }
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
      end

      it '更新できること' do
        sign_in admin
        user_params = attributes_for(:user, name: '更新テスト')
        put admins_user_path(user), params: { user: user_params }
        expect(user.reload.name).to eq '更新テスト'
      end
    end

    context 'パラメータが無効なとき' do
      it 'リクエストが成功すること' do
        sign_in admin
        user_params = attributes_for(:user, name: nil)
        put admins_user_path(user), params: { user: user_params }
        expect(response.status).to eq 200
      end

      it '更新されないこと' do
        sign_in admin
        user_params = attributes_for(:user, name: nil)
        expect {
          put admins_user_path(user), params: { user: user_params }
        }.to_not change(User.find(user.id), :name)
      end
    end

    context '未ログインのとき' do
      it '更新されずログインページにリダイレクトされること' do
        user_params = attributes_for(:user)
        expect {
          put admins_user_path(user), params: { user: user_params }
        }.to_not change(User.find(user.id), :name)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe 'DELETE #destroy' do
    context '管理ユーザーでログイン' do
      it 'リクエストが成功すること' do
        sign_in admin
        delete admins_user_path(user)
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
      end

      it 'ユーザーが削除されること' do
        sign_in admin
        expect {
          delete admins_user_path(user)
        }.to change(User, :count).by(-1)
      end
    end

    context '一般ユーザーでログイン' do
      it 'ログインページにリダイレクトされること' do
        sign_in user
        delete admins_user_path(user)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_admin_session_path
      end

      it 'ユーザーが削除されないこと' do
        sign_in user
        expect {
          delete admins_user_path(user)
        }.to_not change(User, :count)
      end
    end

    context '未ログイン状態' do
      it 'ログインページにリダイレクトされること' do
        delete admins_user_path(user)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_admin_session_path
      end

      it 'ユーザーが削除されないこと' do
        expect {
          delete admins_user_path(user)
        }.to_not change(User, :count)
      end
    end
  end
end