class Admins::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @comment = Comment.find_by(id: params[:id], food_id: params[:food_id])
    if @comment.destroy
      redirect_back(fallback_location: root_path)
    end
  end
end