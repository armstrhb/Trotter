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
      t.boolean :exercised, default: false
      t.boolean :had_boys, default: false
      t.timestamps null: false
    end
  end
end
