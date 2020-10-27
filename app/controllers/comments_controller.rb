class CommentsController < ApplicationController
  def create
    @food = Food.find(params[:food_id])
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      render :index
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], food_id: params[:food_id])
    if @comment.destroy
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :food_id)
  end
end
