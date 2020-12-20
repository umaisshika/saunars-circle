class CommentsController < ApplicationController
  before_action :authority_login
  before_action :set_owner, only: :destroy
  before_action :check_owner, only: :destroy

  def create
    @food = Food.find(params[:food_id])
    @comment = @food.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      @food.create_notification_comment!(current_user, @comment.id)
      render :index
    else
      flash[:alert] = 'コメントに失敗しました'
      redirect_back(fallback_location: root_path)
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
    params.require(:comment).permit(:content)
  end

  def set_owner
    @owner = Comment.find(params[:id]).user
  end
end
