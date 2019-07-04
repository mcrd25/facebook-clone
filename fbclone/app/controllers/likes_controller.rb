class LikesController < ApplicationController
  before_action :find_post, only: [:create]
  before_action :find_like, only: [:destroy]


  def create
    if user_signed_in?
      @like = Like.new(post: @post, user: current_user)
      @like.save
    end 
  end

  def destroy 
    @like.destroy if is_like_owner?
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = Like.find(params[:like_id])
  end

  def is_like_owner?
    current_user == @like.user
  end
end
