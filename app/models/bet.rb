class Bet < ActiveRecord::Base
	belongs_to :user
	belongs_to :match
	validates :amount, numericality: {greater_than: 0, message: "Please enter a valid amount"}
end
