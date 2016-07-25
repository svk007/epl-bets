class BetsController < ApplicationController
	def userbet
		match_number = eval(params["id"])[:value]
		the_match = Match.find(match_number)
		if (the_match.matchtime - (Time.now+(5.5*60*60)))/3600 < 0.5
			flash[:notice] = "You had to bet atleast half hour before the match starts"
			redirect_to :back
			return
		end
		team_name = eval(params["team"])[:value]
		amount = params[:amount].to_i
		decider = Bet.addbet(match_number,the_match,team_name,amount, current_user)
		if decider == true
			flash[:notice] = "You just betted #{amount} coins on #{team_name.empty? ? "draw" : team_name} between #{the_match.hometeam} vs #{the_match.awayteam}"
			redirect_to ('/')
		else
			flash[:notice] = "Please bet a valid amount"
			redirect_to :back
		end
	end
	
	def usersprizes
		@match = Match.find(params[:id])
		@match.bets.each do |bet|
		if bet.team_name == params[:name]
			if params[:place] == "home"
				prize = bet.amount * @match.homeodds
			elsif params[:place] == "away"
				prize = bet.amount * @match.awayodds
			elsif params[:place] == "draw"
				prize = bet.amount * @match.drawodds
			end
			winner = User.find(bet.user_id)
			winner.coins = winner.coins + prize
			winner.save!
			end
		end
		redirect_to ('/')
	end
end
