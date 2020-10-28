class LikesController < ApplicationController
  before_action :set_food

  def create
    @like = current_user.likes.create(food_id: params[:food_id])
  end

  def destroy
    @like = Like.find_by(food_id: params[:food_id], user_id: current_user.id)
    @like.destroy
  end

  private

  def set_food
    @food = Food.find(params[:food_id])
  end
end
