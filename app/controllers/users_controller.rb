class UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
                 .per(PER)
                 .order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end
end
