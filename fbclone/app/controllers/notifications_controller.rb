class NotificationsController < ApplicationController

	def index
		redirect_to(root_path) if not_signed_in? 
		@notifications = Notification.find_by(user_id: current_user.id) if user_signed_in?
	end
end
