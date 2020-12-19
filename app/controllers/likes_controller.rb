class LikesController < ApplicationController
  before_action :authority_login
  before_action :set_owner, only: :destroy
  before_action :check_owner, only: :destroy
  before_action :set_food

  def create
    @like = current_user.likes.create(food_id: params[:food_id])
    @food.create_notification_like!(current_user)
  end

  def destroy
    @like = Like.find_by(food_id: params[:food_id], user_id: current_user.id)
    @like.destroy
  end

  def set_owner
    @owner = Like.find(params[:id]).user
  end

  def set_food
    @food = Food.find(params[:food_id])
  end
end
