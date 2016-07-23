class Bet < ActiveRecord::Base
	belongs_to :user
	belongs_to :match
	validates :amount, numericality: {greater_than: 0, message: "Please enter a valid amount"}
	
	def self.addbet(match_number,the_match,team_name,amount,user) 
		if (amount <= 0)
  		return false
  	end
  	b = Bet.new
  	b.match_id = match_number
  	b.user_id = user.id
  	b.amount = amount
  	b.team_name = team_name.empty? ? "draw" : team_name 
  	user.coins = user.coins - amount
  	user.save!
  	b.save!
	end
end
