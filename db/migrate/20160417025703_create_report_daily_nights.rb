class CreateReportDailyNights < ActiveRecord::Migration
  def change
    create_table :report_daily_nights do |t|
      t.datetime :report_datetime, null: false
      t.float :latitude
      t.float :longitude
      t.float :noise_level
      t.text :what_learned
      t.integer :number_coffees, default: 0
      t.belongs_to :eat_quality
      t.belongs_to :weather
      t.boolean :exercised, default: false
      t.boolean :had_boys, default: false
      t.integer :number_photos_added, default: 0
      t.belongs_to :noise_level_description
      t.integer :number_steps_taken, default: 0      
      t.timestamps null: false
    end
  end
end
