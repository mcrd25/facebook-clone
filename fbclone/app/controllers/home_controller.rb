class HomeController < ApplicationController
  before_action { set_source('home') }

  def index
  	render :new if !user_signed_in?
  	@posts = current_user.home_posts if user_signed_in?
  end
  
end