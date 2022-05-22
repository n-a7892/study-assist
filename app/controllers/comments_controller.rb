class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @save_data = SaveData.find(params[:save_data_id])
    @comment = current_user.comments.new(comment_params)
    @comment.save_data_id = params[:save_data_id]
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @save_data = SaveData.find(params[:save_data_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
