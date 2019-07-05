class CommentsController < ApplicationController
  before_action :find_comment, only: [:edit, :update]

  def create 
    @comment = Comment.new(post_id: params[:post_id], user_id: params[:user_id], message: params[:message])
    @comment.save
  end

  def edit
    render status: :unauthorized if not_comment_owner?
  end

  def update 
    render status: :unauthorized if not_comment_owner?
    @comment.update(comment_params) if is_comment_owner?
  end

  private 

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def is_comment_owner?
    current_user == @comment.user
  end

  def not_comment_owner?
    !current_user == @comment.user
  end

  def comment_params
    params.require(:comment).permit(:message)
  end
end
