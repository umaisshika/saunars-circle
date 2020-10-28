class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(food_id: params[:food_id])
    flash[:success] = 'お気に入り登録をしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(food_id: params[:food_id], user_id: current_user.id)
    @like.destroy
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
