class CreateReportDailyMornings < ActiveRecord::Migration
  def change
    create_table :report_daily_mornings do |t|
      t.datetime :report_datetime, null: false
      t.float :latitude
      t.float :longitude
      t.float :noise_level
      t.belongs_to :sleep_quality
      t.float :sleep_duration
      t.integer :number_drinks, default: 0
      t.timestamps null: false
    end
  end
end
