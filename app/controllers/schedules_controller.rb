class SchedulesController < ApplicationController
  def manage
    @teamusers = TeamUser.where(user_id: current_user.id)
    # debugger

    @teams = []
    teams = TeamUser.where(user_id: current_user.id).pluck(:team_id).uniq
    teams.each { |team|
        schedule = nil
        schedule = Schedule.where(team_id: team).pluck(:name, :place, team.name)
        @schedules << schedule
    }

  end

  def new
  	@schedule = Schedule.new
    @admin_teams = TeamUser.where(user_id: current_user, admin: true)
    @admin_teams.count
    if @admin_teams.count >= 2
      @admin_team_flag = true
    else
      @admin_team_flag = false
    end
  end

  def create
  	@schedule = Schedule.new(schedule_params)
  	# @schedule.team_id = params[:team_id]

  	@schedule.save
    # debugger
  	redirect_to root_path
  end

  def index
		@schedules = []
	 	teams = TeamUser.where(user_id: current_user.id).pluck(:team_id).uniq
		teams.each { |team|
        schedule = nil
		  	schedule = Schedule.where(team_id: team).pluck(:name, :place, team.name)
        @schedules << schedule
		}
  end

  private
    def schedule_params
    	params.require(:schedule).permit(:name, :place, :team_id, :datetime, :remark)
    end
end




