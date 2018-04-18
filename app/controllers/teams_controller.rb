class TeamsController < ApplicationController
  def index

    @teams = current_user.teams.pluck(:id, :name, :image_id)
    @teams_info = []
    @teams.each{|team|
      team << TeamUser.where(team_id: team[0]).count
      @teams_info << team
    }

    @teams = Team.all
  end

  def invite
    @team_id = params[:team_id]
    debugger

    @users = User.search(params[:search])
    debugger
  end

  def join_new
  end

  def show
    @team = Team.find(params[:id])
    @team_menber = TeamUser.where(team_id: params[:id])

    @users = User.search(params[:search])
  end

  def new
  	@team = current_user.teams.build
  end

  def create
  	@team = current_user.teams.build(team_params)
    @team.active = true
    @team.team_key = SecureRandom.hex(5)

  	if @team.save
	  	@team_user = TeamUser.new
	  	@team_user.team_id = @team.id
	  	@team_user.user_id = current_user.id
	  	@team_user.status = 2
	  	@team_user.admin = 1
	  	if !(@team_user.save)
	  		@team.destroy
	  		redirect_to new_team_path , notice: "チームを作成できませんでした。"
	  	end
      # debugger
  		redirect_to team_path(@team), notice: "チームを作成しました。"
  	else
        redirect_to new_team_path , notice: "チームを作成できませんでした。"
  	end
  end

  def edit
    @team = Team.find(params[:id])

  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to team_path(team.id)

  end


  def manage
    
  end


  private
  def team_params
  	params.require(:team).permit(:name, :organization, :level, :active_place,:description, :team_key, :active, :image, :picture, :admin)
  end
end
