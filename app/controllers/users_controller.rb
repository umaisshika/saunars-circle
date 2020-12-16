class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  before_action :set_user, only: [:show, :destroy, :followings, :followers, :like_foods]
  before_action :admin_user, only: :destroy

  def index
    @users = User.page(params[:page])
                 .per(PER)
                 .order(created_at: :desc)
    @nil_message = 'まだ登録者がいません'
  end

  def show
    @foods = Food.where(user_id: @user.id)
                 .page(params[:page])
                 .per(PER)
                 .order(created_at: :desc)
    @food = @user.foods.build
    @nil_message = 'まだ投稿がありません'
  end

  def destroy
    @user.destroy
    flash[:success] = "「#{@user.name}」は正常に削除されました"
    redirect_to root_path
  end

  def followings
    @followings = @user.followings.page(params[:page])
                       .per(PER)
                       .order(created_at: :desc)
    @nil_message = 'まだお気に入りしていません'
  end

  def followers
    @followers = @user.followers.page(params[:page])
                      .per(PER)
                      .order(created_at: :desc)
    @nil_message = 'まだお気に入られされていません'
  end

  def like_foods
    @foods = @user.liked_foods.page(params[:page])
                  .per(PER)
                  .order(created_at: :desc)
    @nil_message = 'まだいいねした投稿がありません'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
