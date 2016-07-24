class SessionsController < ApplicationController
	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		flash[:notice] = "Succesfully signed in through Facebook account"
		redirect_to root_path
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged Out"
		redirect_to root_path
	end
end
