class MatchesController < ApplicationController
	before_action :check_loggedin, except: [:index]
  def index
    @matches = Match.all
  end
  
  def new
  	@match = Match.new
  end
  
  def create
  	@match = Match.new(match_params)
  	if @match.save
  		flash[:notice] = "Match successfully updated"
  		redirect_to matches_path
  	else
  		render 'new'
  	end
  end
  
  def show
  	@match = Match.find(params[:id])
  	gon.homemul = @match.homeodds
  	gon.awaymul = @match.awayodds
  	gon.drawmul = @match.drawodds
  end
  
  private
  def match_params
    params.require(:match).permit(:hometeam,:awayteam,:homeodds,:awayodds,:drawodds,:stadium,:matchtime)
  end
end
