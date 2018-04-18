class AddAdminFlagToTeamUser < ActiveRecord::Migration[5.2]
  def change
    add_column :team_users, :admin_flag, :boolean
  end
end
