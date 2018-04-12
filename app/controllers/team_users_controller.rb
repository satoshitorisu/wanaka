class TeamUsersController < ApplicationController
  def index
  	# @users = User.all
  	@teams = TeamUser.where(user_id: current_user.id, admin: true)
  	# debugger
  end
  def invitate
  	
  end
  def new
  	@team_user = TeamUser.new
  	@team_id = params[:team_id]
  	# @team_user.user_id = params[:team_id]

  	# @team_user.save
  	# @team_user = TeamUser.new(:team_id => team_id ,:user_id => user_id, :join => 0, :admin => 0)

  end


  def create
  	@create_team_user = TeamUser.new(team_params)
  	@create_team_user.team_id = params[:team_id]
  	# debugger
	if @create_team_user.save
  	# debugger
		redirect_to team_users_path
	else
		redirect_to :back
	end
  end

  private
  def team_params
  	params.require(:team_user).permit(:team_id, :user_id)
  end
end
