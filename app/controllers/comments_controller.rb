class CommentsController < ApplicationController
  def create
    @food = Food.find(params[:food_id])
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to request.referer || root_url
    else
      flash.now[:alert] = 'コメントに失敗しました'
      redirect_to @food
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :food_id)
  end
end
