class RemoveJoinFromTeamUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :team_users, :join, :string
    remove_column :team_users, :remark, :string
    remove_column :team_users, :admin_flag, :string
  end
end
