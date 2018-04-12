class TeamsController < ApplicationController
  def new
  	@team = current_user.teams.build
  end

  def create
  	@team = current_user.teams.build(team_params)
  	if @team.save
	  	@team_user = TeamUser.new
	  	@team_user.team_id = @team.id
	  	@team_user.user_id = current_user.id
	  	@team_user.admin = 1
	  	@team_user.join = 1
	  	if !(@team_user.save)
	  		@team.destroy
	  		redirect_to new_team_path , notice: "チームを作成できませんでした。"
	  	end
  		redirect_to :root , notice: "チームを作成しました。"
  	else
  		redirect_to :root , notice: "チームを作成しました。"
  	end
  end

  private
  def team_params
  	params.require(:team).permit(:name)
  end
end
