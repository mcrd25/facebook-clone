class HomeController < ApplicationController

  # before_action :authenticate_user!

  def index
  	if !user_signed_in? 
  		render 'new'
  	end
  end
end