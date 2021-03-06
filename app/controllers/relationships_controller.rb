class RelationshipsController < ApplicationController
  before_action :authority_login
  before_action :set_user
  before_action :set_owner, only: :destroy
  before_action :check_owner, only: :destroy

  def create
    following = current_user.follow(@user)
    following.save
    @followers = @user.followers.page(params[:page])
                      .per(PER)
                      .order(created_at: :desc)
    @user.create_notification_follow!(current_user)
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

  def set_owner
    @owner = User.find(params[:relationship][:user_id])
  end
end
