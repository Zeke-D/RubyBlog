class ApplicationController < ActionController::Base

	def current_user
		if session[:user] != nil
			User.find(session[:user]['id'])
		else
			nil
		end
		
		#ternary statement not working? for some reason, 
		#returns whole ternary statement as the return value
		#defined? session[:user] ? User.find(session[:user]['id']) : nil
	end

	helper_method :current_user

end
