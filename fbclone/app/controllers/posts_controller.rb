class PostsController < ApplicationController
	before_action :is_not_current_user?, only: [:index]
	
  def index
  end

  def show
  end
end
