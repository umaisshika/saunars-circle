class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :following_foods]
  before_action :set_food, only: [:show, :update, :edit, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @q = Food.ransack(params[:q])
    @foods = @q.result(distinct: true)
               .page(params[:page])
               .per(PER)
               .order(created_at: :desc)
  end

  def new
    @food = current_user.foods.build if user_signed_in?
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      flash[:success] = '投稿しました'
      redirect_to foods_path
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @food.comments.order(id: 'DESC')
    @like = Like.new
  end

  def edit; end

  def update
    if @food.update(food_params)
      flash[:success] = '投稿を更新しました'
      redirect_to food_path(@food.id)
    else
      flash.now[:danger] = '編集出来ません。入力必須項目を確認してください'
      render :edit
    end
  end

  def destroy
    @food.destroy
    flash[:success] = '投稿を削除しました'
    redirect_to foods_path
  end

  def following_foods
    @user = current_user
    @users = @user.followings
    @users.each do |user|
      @q_following = Food.ransack(params[:q_following])
      @foods = @q_following.result(distinct: true).where(user_id: user.id)
                           .page(params[:page])
                           .per(PER)
                           .order(created_at: :desc)
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :visited_sauna, :prefecture_id, :description, :image)
  end

  def correct_user
    redirect_to(root_url) unless (@food.user_id == current_user.id) || current_user.admin?
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
