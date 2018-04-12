class AddAdminToTeamUser < ActiveRecord::Migration[5.2]
  def change
    add_column :team_users, :admin, :boolean
    add_column :team_users, :join, :boolean
  end
end
