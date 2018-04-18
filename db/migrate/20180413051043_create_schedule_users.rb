class CreateScheduleUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_users do |t|
      t.integer :schedule_id
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
