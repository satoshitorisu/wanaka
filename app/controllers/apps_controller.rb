class AppsController < ApplicationController
	def index
		# @teams = current_user.teams
		# @teams = Team.all
		# @teams = current_user.teams
		@teams = Team.all
		# debugger
	end
end
