class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'お気に入り追加しました'
      redirect_to @user
    else
      flash.now[:alert] = 'お気に入り追加に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'お気に入りを解除しました'
      redirect_to @user
    else
      flash.now[:alert] = 'お気に入り解除に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end
end
