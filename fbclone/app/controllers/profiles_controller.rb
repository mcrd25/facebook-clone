class ProfilesController < ApplicationController
  def show 
  	@user = current_user
  end

  def edit
    redirect_to :show if !user_signed_in?
  end
end
