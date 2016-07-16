class BetsController < ApplicationController
	def userbet
  	match_number = eval(params["id"])[:value]
  	the_match = Match.find(match_number)
  	team_name = eval(params["team"])[:value]
  	amount = params[:amount].to_i
  	if (amount <= 0)
  		flash[:notice] = "Please enter a valid amount"
  		redirect_to :back
  		return
  	end
  	b = Bet.new
  	b.match_id = match_number
  	b.user_id = current_user.id
  	b.amount = amount
  	b.team_name = team_name.empty? ? "draw" : team_name 
  	current_user.coins = current_user.coins - amount
  	current_user.save!
  	b.save!
  	flash[:notice] = "You just betted #{amount} coins on #{team_name.empty? ? "draw" : team_name} between #{the_match.hometeam} vs #{the_match.awayteam}"
  	redirect_to ('/')
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
