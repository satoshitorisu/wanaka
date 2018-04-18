class AddPictureToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :picture, :string
  end
end
