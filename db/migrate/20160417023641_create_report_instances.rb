class CreateReportInstances < ActiveRecord::Migration
  def change
    create_table :report_instances do |t|
      t.datetime :report_datetime, null: false
      t.float :latitude
      t.float :longitude
      t.integer :number_photos_added, default: 0
      t.float :noise_level
      t.integer :number_steps_taken, default: 0
      t.boolean :is_working, default: false
      t.belongs_to :activity
      t.belongs_to :location
      t.belongs_to :feeling
      t.belongs_to :feeling_reason
      t.belongs_to :weather
      t.belongs_to :noise_level_description
      t.timestamps null: false
    end

    create_table :people_report_instances, id: false do |t|
      t.belongs_to :report_instance, index: true
      t.belongs_to :person, index: true
    end
  end
end
