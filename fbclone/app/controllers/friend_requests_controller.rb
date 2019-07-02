class FriendRequestsController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    if user_signed_in?
      @friend_request = FriendRequest.new(requester: current_user, requestee: @user)
      @friend_request.save
    end
  end

  private 

  def request_params
    #params.require(:friend_request).permit(:requester_id, :requestee_id)
  end
end
