class LikesController < ApplicationController
  before_action :find_like, only: [:destroy]


  def create
    if user_signed_in?
      @like = Like.new(post_id: params[:post_id], user: current_user)
      @like.save
    end 
  end

  def destroy 
    @like.destroy if is_like_owner? && user_signed_in?
  end

  private


  def find_like
    @like = Like.find(params[:id])
  end

  def is_like_owner?
    current_user == @like.user
  end
end
