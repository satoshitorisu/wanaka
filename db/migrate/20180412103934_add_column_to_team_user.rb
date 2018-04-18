class AddColumnToTeamUser < ActiveRecord::Migration[5.2]
  def change
    add_column :team_users, :remark, :string
  end
end
