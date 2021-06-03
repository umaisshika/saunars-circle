class Admins::FoodsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_food, only: [:show, :update, :edit, :destroy]


  def index
    @q = Food.ransack(params[:q])
    @foods = @q.result(distinct: true)
               .page(params[:page])
               .per(PER)
               .order(created_at: :desc)
    @nil_message = 'まだ投稿がありません'
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
      redirect_to admins_food_path(@food.id)
    else
      flash.now[:danger] = '編集出来ません。入力必須項目を確認してください'
      render :edit
    end
  end

  def destroy
    @food.destroy
    flash[:success] = '投稿を削除しました'
    redirect_to admins_foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :visited_sauna, :prefecture_id, :description, :image)
  end

  def set_food
    @food = Food.find(params[:id])
  end

  def foods_search_params
    params.require(:q_following).permit(:name_cont_any)
  end
end
