class UsersController < ApplicationController
	def leaderboard
		@users = User.order(coins: :DESC)
	end
end
