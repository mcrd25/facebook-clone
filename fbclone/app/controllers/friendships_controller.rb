class FriendshipsController < ApplicationController
  def create
    if user_signed_in?
      @friendship = Friendship.new(active_friend: params[:friend], passive_friend: current_user)
      @friendship.save
    end
  end

  def destroy
    if user_signed_in?
      @friendship = Friendship.find_by(id: params[:id])
      @friendship.destroy if current_user == @friendship.active_friend || current_user == @friendship.passive_friend
    end
  end
end
