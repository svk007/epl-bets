class UsersController < ApplicationController
	before_action :check_loggedin, only: [:mybets]
	def leaderboard
		@users = User.order(coins: :DESC).order(name: :ASC)
	end
	
	def mybets
		@user = User.find(current_user.id)
		@bets = @user.bets.order(created_at: :DESC)
	end
end
