class HomeController < ApplicationController
  def top
    @q = Food.ransack(params[:q])
    @foods = @q.result(distinct: true)
               .page(params[:page])
               .per(PER)
               .order(created_at: :desc)
    @nil_message = 'まだ投稿がありません'
  end
end
