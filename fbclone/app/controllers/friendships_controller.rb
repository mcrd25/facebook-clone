class FriendshipsController < ApplicationController
  def create
    if user_signed_in?
      @friendship = Friendship.new(active_friend_id: params[:active_friend_id], passive_friend_id: current_user.id)
      @friendship.save
    end
  end

  def destroy
    if user_signed_in?
      @friendship = Friendship.find(params[:id])
      @friendship.destroy if are_friends?
    end
  end

  private 

  def are_friends?
    current_user == @friendship.active_friend || current_user == @friendship.passive_friend
  end
end
