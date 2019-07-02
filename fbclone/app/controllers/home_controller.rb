class HomeController < ApplicationController

  def index
  	render :new if !user_signed_in?
  	@posts = current_user.home_posts if user_signed_in?
  end

end