class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user
  protect_from_forgery 
 	private

	def current_user
		# binding.pry
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	OmniAuth.config.logger = Rails.logger
end
