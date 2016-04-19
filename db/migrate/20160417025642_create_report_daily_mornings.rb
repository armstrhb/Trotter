class CreateReportDailyMornings < ActiveRecord::Migration
  def change
    create_table :report_daily_mornings do |t|
      t.datetime :report_datetime, null: false
      t.float :latitude
      t.float :longitude
      t.float :noise_level
      t.belongs_to :sleep_quality
      t.belongs_to :weather
      t.float :sleep_duration
      t.integer :number_drinks, default: 0
      t.integer :number_photos_added, default: 0
      t.belongs_to :noise_level_description
      t.integer :number_steps_taken, default: 0
      t.timestamps null: false
    end
  end
end
