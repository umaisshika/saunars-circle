class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    following.save
    @followers = @user.followers.page(params[:page])
                      .per(PER)
                      .order(created_at: :desc)
  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
    @followers = @user.followers.page(params[:page])
                      .per(PER)
                      .order(created_at: :desc)
  end

  private

  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end
end
