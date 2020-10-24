class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :update, :edit]

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
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

  def show; end

  def edit; end

  def update
    if @food.update(food_params)
      flash[:success] = 'サ飯を更新しました'
      redirect_to food_path(@food.id)
    else
      render 'edit', alert: '編集出来ません。入力必須項目を確認してください'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :visited_sauna, :prefecture_id, :description, :image)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
