class FriendRequestsController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    if user_signed_in?
      @friend_request = FriendRequest.new(requester: current_user, requestee: @user)
      @friend_request.save
    end
  end

  def destroy
    if user_signed_in?
      @friend_request = FriendRequest.find_by(id: params[:id])
      @friend_request.destroy if current_user == @friend_request.requester || current_user == @friend_request.requestee
    end
  end
end