class NotificationsController < ApplicationController

	def index
		redirect_to(root_path) if not_signed_in? 
		# @notifications = current_user. if user_signed_in?
	end
end
