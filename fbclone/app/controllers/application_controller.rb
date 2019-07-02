class ApplicationController < ActionController::Base
	include DeviseWhitelist
	include UserStatus
end
