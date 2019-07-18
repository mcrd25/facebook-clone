class ProfilesController < ApplicationController
	before_action :set_user
	
	before_action only: [:show] do
		set_source('profile')
	end

  def show 
  end

  def edit
    redirect_to  action: 'show',
                 username: params[:username] if not_current_user?
  end
end
