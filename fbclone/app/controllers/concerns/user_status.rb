module UserStatus
	extend ActiveSupport::Concern
	included do 
		before_action :set_user
	end



  def set_user
  	@user = User.find_by(username: params[:username])
  end

  def is_not_current_user?
  	current_user != @user
  end
end