class UsersController < ApplicationController
	before_action :check_loggedin, only: [:mybets]
	def leaderboard
		all_users = User.all
		users_hash = {}
		@bets = []
		all_users.each do |user|
			invested = 0
			user.bets.each do |bet|
				if bet.winner == "TBD"
					invested = invested + bet.amount
				end
			end
			total_amt = user.coins + invested
			users_hash[user] = total_amt
		end
		sortedusers = users_hash.sort_by {|k,v| v}.reverse.to_h
		@users = []
		sortedusers.each do |k,v|
			@users << k
			@bets << v
		end
	end
	
	def mybets
		@user = User.find(current_user.id)
		@bets = @user.bets.order(created_at: :DESC)
	end
end
