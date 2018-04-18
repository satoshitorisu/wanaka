class TeamUsersController < ApplicationController
  def index
    # debugger
  	@team_users = TeamUser.where(user_id: current_user.id, admin: true)
  end
  
  def new
  	@team_user = TeamUser.new
    @team_id = params[:team_id]
    status = params[:status]
    # debugger
  end

  def create
    @team = TeamUser.new
    @team.team_id = params[:team_id]
    @team.user_id = current_user.id
    @team.admin = 0
    @team.status = params[:status]
    @team.save
    redirect_to root_path
  end

  def apply
    @teams = Team.search(params[:search])
  end

  def invite
      @teams = Team.search(params[:search])
  end

  private
  def team_params
  	params.require(:team_user).permit(:team_id, :user_id, :remark)
  end
end
