class SchedulesController < ApplicationController
  def new
  	@schedule = Schedule.new
  end

  def create
  	@schedule = Schedule.new(schedule_params)
  	@schedule.team_id = 1

  	@schedule.save
  	redirect_to root_path
  end

  def index
		@schedules = []
	 	teams = TeamUser.where(user_id: current_user.id).pluck(:team_id).uniq
		teams.each { |team|
        schedule = nil
		  	schedule = Schedule.where(team_id: team).pluck(:name, :place, team)
        @schedules << schedule
		}
  end

  private
    def schedule_params
    	params.require(:schedule).permit(:name, :place, :team_id)
    end
end




