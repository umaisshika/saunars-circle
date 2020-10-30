class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  before_action :admin_user, only: :destroy

  def index
    @users = User.page(params[:page])
                 .per(PER)
                 .order(created_at: :desc)
  end

  def show
    @foods = Food.where(user_id: @user.id)
                 .page(params[:page])
                 .per(PER)
                 .order(created_at: :desc)
    @food = @user.foods.build
  end

  def destroy
    @user.destroy
    flash[:success] = "「#{@user.name}」は正常に削除されました"
    redirect_to users_path
  end

  def followings
    @followings = @user.followings
  end

  def followers
    @followers = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
