class AddDateTimeToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :datetime, :datetime
    add_column :schedules, :remark, :text
    add_reference :schedules, :team, foreign_key: true
  end
end
