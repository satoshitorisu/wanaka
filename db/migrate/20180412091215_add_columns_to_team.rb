class AddColumnsToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :sport, :string
    add_column :teams, :active_place, :string
    add_column :teams, :organization, :string
    add_column :teams, :level, :string
    add_column :teams, :description, :text
    add_column :teams, :active, :boolean
  end
end
