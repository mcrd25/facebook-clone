class HomeController < ApplicationController
  before_action :set_source

  def index
  	render :new if !user_signed_in?
  	@posts = current_user.home_posts if user_signed_in?
    
  end

  private 

  def set_source
    session[:foo] = 'home'
  end
end