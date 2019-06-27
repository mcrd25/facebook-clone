class ProfilesController < ApplicationController
	before_action :set_user
  def show 
  end

  def edit
    redirect_to  action: 'show', username: params[:username] if !user_signed_in?
  end

  private
  def set_user
  	@user = User.find_by(username: params[:username])
  end
end
