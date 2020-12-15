# require 'rails_helper'

# RSpec.describe 'Users', type: :request do
#   let!(:user) { create(:user) }
#   let!(:admin_user) { create(:user, name: '管理ユーザー', admin: true) }
#   describe 'GET #index' do
#     it 'リクエストが成功すること' do
#       sign_in user
#       get users_path
#       expect(response).to have_http_status 200
#     end
#   end

#   describe 'POST #create' do
#     context 'パラメータが有効な場合' do
#       it 'リクエストが成功すること' do
#         user_params = FactoryBot.attributes_for(:user)
#         sign_in user
#         post '/users', params: { user: user_params }
#         expect(response.status).to eq 302
#       end
#     end
#   end
# end
