class LikesController < ApplicationController
  before_action :authority_login
  before_action :set_owner, only: :destroy
  before_action :check_owner, only: :destroy

  def create
    @food = Food.find(params[:food_id])
    @food.like(current_user) unless @food.already_liked?(current_user)
    @food.create_notification_like!(current_user)
  end

  def destroy
    @food = Like.find(params[:id]).food
    @food.unlike(current_user)
  end

  def set_owner
    @owner = Like.find(params[:id]).user
  end
end
