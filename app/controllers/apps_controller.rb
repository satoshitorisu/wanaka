class AppsController < ApplicationController
	def index
		# いずれかのチームの管理者か否か判定
		if user_signed_in?
			@admin = 0

			@admin = TeamUser.where("(user_id = ?) AND (admin = ?)", current_user.id,1)
			if @admin.presence
				@admin = true
			else
				@admin = false
			end

			@schedules = []
		 	teams = TeamUser.where(user_id: current_user.id).pluck(:team_id).uniq
			teams.each { |team|
	        schedule = nil
			  	# debugger
			  	schedule = []
			  	schedule << Team.where(id: team).pluck(:name)[0] # team name
			  	schedule << Schedule.where(team_id: team).pluck(:team_id, :name, :place)
				#参加人数
			  	#欠席人数
			  	#保留人数
			  	#debugger

	        @schedules << schedule
			# debugger
			}
		end
	end

	def message
	end
	
	def team
	end

	def schduele
	end

	def profile
	end
end
