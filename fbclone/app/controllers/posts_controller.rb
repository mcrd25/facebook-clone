class PostsController < ApplicationController
  before_action :set_post
	
  def index
  end

  def show
    redirect_to profile_posts_path if not_signed_in?
  end

  def edit 
    if not_post_owner? && not_signed_in?
      redirect_to profile_posts_path
    elsif not_post_owner?
      redirect_to profile_post_path
    end
  end

  def update
    if @post.update(post_params)
      redirect_to profile_posts_path
    else
      redirect_to edit_profile_post_path
    end
  end

  private 

  def set_post 
    @post = Post.find_by(id: params[:id])
  end

  def not_post_owner?
    current_user != @post.user
  end

  def post_params
    params.require(:post).permit(:message)
  end
end
