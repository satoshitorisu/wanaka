class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.datetime :datetime
      t.string :place
      t.string :level
      t.string :price
      t.text :remark
      t.references :team, foreign_key: true
      t.string :active

      t.timestamps
    end
  end
end
