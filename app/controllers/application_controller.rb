class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_filter :require_sign_in
	private
		def require_sign_in
			if  session[:std_id].nil?
				flash[:error] = "You must be logged in to access this section"
		    render "main/index" # halts request cycle
			end
		end
end
