class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :update, :edit, :destroy]

  def index
    @foods = Food.page(params[:page])
                 .per(PER)
                 .order(created_at: :desc)
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

  def show
    @comments = @food.comments.order(id: 'DESC')
    @comment = current_user.comments.new
  end

  def edit; end

  def update
    if @food.update(food_params)
      flash[:success] = 'サ飯を更新しました'
      redirect_to food_path(@food.id)
    else
      render 'edit', alert: '編集出来ません。入力必須項目を確認してください'
    end
  end

  def destroy
    if @food.user_id == current_user.id || current_user.admin?
      if @food.destroy
        flash[:success] = '投稿を削除しました'
        redirect_to foods_path
      else
        flash.now[:danger] = '投稿の削除に失敗しました'
        render :show
      end
    else
      render action: :show,
             alert: '投稿削除する権限がありません'
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
