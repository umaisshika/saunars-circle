# require 'rails_helper'

# RSpec.describe 'Likes', type: :request do
#   let!(:user) { create(:user) }
#   let!(:food) { create(:food, user_id: user.id) }

#   describe 'POST #create' do
#     context 'ログイン状態のとき' do
#       it 'いいねできること' do
#         sign_in user
#         expect {
#           post food_likes_path(food, user.id)
#         }.to change { Like.count }.by(1)
#         expect(response).to have_http_status 200
#       end
#     end
#   end

#   # describe 'DELETE #destroy' do
#   #   before do
#   #     @user = FactoryBot.create(:user)
#   #     @food = FactoryBot.create(:food)
#   #     @like = FactoryBot.create(:like, user_id: user.id)
#   #   end
#   #   it 'いいね解除できること' do
#   #     sign_in user
#   #     expect {
#   #       delete food_like_path(id: @like.id, food_id: @food.id)
#   #     }.to change { Like.count }.by(-1)
#   #     expect(response).to have_http_status 200
#   #   end
#   # end
# end
