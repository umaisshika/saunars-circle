class FoodsController < ApplicationController
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

  private

  def food_params
    params.require(:food).permit(:name, :visited_sauna, :prefecture_id, :description, :image)
  end
end
