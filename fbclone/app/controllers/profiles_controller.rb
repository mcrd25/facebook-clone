class ProfilesController < ApplicationController
	before_action :set_user

  def show 
    session[:source] = 'profile'
  end

  def edit
    redirect_to  action: 'show',
                 username: params[:username] if not_current_user?
  end
end
