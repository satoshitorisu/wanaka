class AddStatusToTeamUser < ActiveRecord::Migration[5.2]
  def change
    add_column :team_users, :status, :integer
  end
end
