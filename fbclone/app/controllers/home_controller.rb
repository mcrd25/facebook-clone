class HomeController < ApplicationController

  def index
  	render :new if !user_signed_in?
  end

end