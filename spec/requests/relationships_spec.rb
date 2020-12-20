require 'rails_helper'

RSpec.describe 'Relationships', type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  describe 'POST #create' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        relationship_params = attributes_for(:relationship, user_id: user.id, follow_id: other_user.id)
        sign_in user
        post relationships_path, xhr: true, params: { relationship: relationship_params }
        expect(response).to have_http_status '200'
      end

      it 'フォローできること' do
        relationship_params = attributes_for(:relationship, user_id: user.id, follow_id: other_user.id)
        sign_in user
        expect {
          post relationships_path, xhr: true, params: { relationship: relationship_params }
        }.to change(Relationship, :count).by(1)
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        relationship_params = attributes_for(:relationship, user_id: user.id, follow_id: other_user.id)
        post relationships_path, xhr: true, params: { relationship: relationship_params }
        expect(response).to redirect_to new_user_session_path
        expect(response).to have_http_status '200'
      end

      it 'フォローできないこと' do
        relationship_params = attributes_for(:relationship, user_id: user.id, follow_id: other_user.id)
        expect {
          post relationships_path, xhr: true, params: { relationship: relationship_params }
        }.to_not change(Relationship, :count)
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        relationship_params = attributes_for(:relationship, user_id: user.id, follow_id: other_user.id)
        post relationships_path, xhr: true, params: { relationship: relationship_params }
        expect(response).to redirect_to new_user_session_path
        expect(response).to have_http_status '200'
      end

      it 'フォローできないこと' do
        relationship_params = attributes_for(:relationship, user_id: user.id, follow_id: other_user.id)
        expect {
          post relationships_path, xhr: true, params: { relationship: relationship_params }
        }.to_not change(Relationship, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:follow) { Relationship.create(user_id: user.id, follow_id: other_user.id) }

    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
        relationship_params = attributes_for(:relationship, user_id: user.id, follow_id: other_user.id)
        sign_in user
        delete relationship_path(other_user.id), xhr: true, params: { relationship: relationship_params }
        expect(response).to have_http_status '200'
      end

      it 'フォロー解除できること' do
        relationship_params = attributes_for(:relationship, user_id: user.id, follow_id: other_user.id)
        sign_in user
        expect {
          delete relationship_path(other_user.id), xhr: true, params: { relationship: relationship_params }
        }.to change(Relationship, :count).by(-1)
      end
    end

    context 'オーナー権を持たないユーザーでログイン' do
      it 'トップページにリダイレクトされること' do
        relationship_params = attributes_for(:relationship, user_id: user.id, follow_id: other_user.id)
        sign_in other_user
        delete relationship_path(other_user.id), xhr: true, params: { relationship: relationship_params }
        expect(response).to redirect_to root_path
        expect(response).to have_http_status '200'
      end

      it 'フォロー解除できないこと' do
        relationship_params = attributes_for(:relationship, user_id: user.id, follow_id: other_user.id)
        sign_in other_user
        expect {
          delete relationship_path(other_user.id), xhr: true, params: { relationship: relationship_params }
        }.to_not change(Relationship, :count)
      end
    end

    context '未ログイン状態のとき' do
      it 'ログインページにリダイレクトされること' do
        relationship_params = attributes_for(:relationship, user_id: user.id, follow_id: other_user.id)
        delete relationship_path(other_user.id), xhr: true, params: { relationship: relationship_params }
        expect(response).to redirect_to new_user_session_path
        expect(response).to have_http_status '200'
      end

      it 'フォロー解除できないこと' do
        relationship_params = attributes_for(:relationship, user_id: user.id, follow_id: other_user.id)
        expect {
          delete relationship_path(other_user.id), xhr: true, params: { relationship: relationship_params }
        }.to_not change(Relationship, :count)
      end
    end
  end
end
