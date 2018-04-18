class GamesController < ApplicationController
  def new
  	@game = Game.new
  end

  def create
  	@game = Game.new(game_params)
  	@game.team_id = 1
  	# debugger
  	@game.save
  	redirect_to new_game_path
  end


  private
    def game_params
    	params.require(:game).permit(:title, :place)
    end
end




