class CreateSleepQualities < ActiveRecord::Migration
  def change
    create_table :sleep_qualities do |t|
      t.string :name, default: false
      t.timestamps null: false
    end
  end
end
