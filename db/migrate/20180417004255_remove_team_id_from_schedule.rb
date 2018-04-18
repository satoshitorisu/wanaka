class RemoveTeamIdFromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :team_id, :integer
  end
end
