class AddPlaceToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :place, :string
  end
end
