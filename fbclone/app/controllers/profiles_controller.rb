class ProfilesController < ApplicationController
	before_action :set_user
	before_action :is_not_current_user?, only: [:show]

  def show 
  end

  def edit
    redirect_to  action: 'show',
                 username: params[:username] if is_not_current_user?
  end

  private

  def set_user
  	@user = User.find_by(username: params[:username])
  end

  def is_not_current_user?
  	current_user != @user
  end
end
