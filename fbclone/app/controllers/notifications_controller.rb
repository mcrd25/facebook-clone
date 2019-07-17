class NotificationsController < ApplicationController

	def index
		redirect_to(root_path) if not_signed_in? 
		@notifications = current_user.notifications.order(created_at: :desc)
	end
end
