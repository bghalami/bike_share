class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.date :date
      t.float :max_temp
      t.float :mean_temp
      t.float :min_temp
      t.float :mean_humidity
      t.float :mean_visibility
      t.float :mean_wind_speed
      t.float :precip
      t.timestamps
    end
  end
end
