class UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'アカウント情報を変更しました。'
      redirect_to root_path
    else
      flash.now[:danger] = '編集出来ません。入力必須項目を確認してください'
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "「#{@user.name}」は正常に削除されました"
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :avatar,
      :name,
      :gender,
      :sauna_career,
      :home_sauna,
      :prefecture_id,
      :description,
      :profile
    )
  end
end
